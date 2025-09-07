import argparse
import shutil
import os
import sys
import subprocess
import datetime

from pathlib import Path


ROOT = Path(__file__).parent.resolve()


NVIM_CONFIG_PATH = Path(Path.home(), ".config", "nvim")
NEOVIDE_CONFIG_PATH = Path(Path.home(), ".config", "neovide")


def err(text):
    print(text)
    sys.exit(1)


def run(cmd, **kwargs):
    print(">>>", *cmd, sep=" ", end="")
    subprocess.run(cmd, **kwargs)


def rmtree(path: Path):
    print(">>>", f"rm -rf {path}")
    shutil.rmtree(path)


def copytree(src: Path, dst: Path):
    print(">>>", f"cp -r {src} {dst}")
    shutil.copytree(src, dst, dirs_exist_ok=True)


def work_replace_local(args):
    destination_path =  globals()[f"{args.name.upper()}_CONFIG_PATH"] if args.d is None else args.d
    source_path = Path(ROOT, args.name)
    rmtree(destination_path)
    copytree(source_path, destination_path)


def work_update_repo(args):
    source_path = globals()[f"{args.name.upper()}_CONFIG_PATH"] if args.d is None else args.d
    destination_path = Path(ROOT, args.name)
    rmtree(destination_path)
    copytree(source_path, destination_path)


def work_git_push(args):
    os.chdir(ROOT)
    run(["git", "add", "."], check=True)
    time_string = datetime.datetime.now().strftime("%Y/%m/%d-%H:%M:%S")
    run(["git", "commit", "-m", f"{time_string}"], check=True)
    run(["git", "push"], check=True)


def do_work(args):
    if not Path(ROOT, args.name).is_dir():
        err(f"Unknown name: {args.name}")
    if args.d is not None:
        args.d = Path(args.d).resolve()
        if not args.d.is_dir():
            err(f"Not a directory: {args.d}")
    if args.action == "replace_local":
        work_replace_local(args)
    elif args.action == "update_repo":
        work_update_repo(args)
        if args.g:
            work_git_push(args)
    else:
        assert "Unknown action"
    print("Work done!")


def main():
    argparser = argparse.ArgumentParser()
    argparser.add_argument("name", type=str)
    argparser.add_argument("action", type=str, choices=("replace_local", "update_repo"))
    argparser.add_argument("-d", type=str, metavar="PATH", help="Custom directory")
    argparser.add_argument("-g", action="store_true", help="Make git push")
    args = argparser.parse_args()
    do_work(args)


if __name__ == "__main__":
    main()

