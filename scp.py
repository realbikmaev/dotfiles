from pathlib import Path
from subprocess import run
from sys import argv

dotfiles = Path(__file__).parent.absolute()
user = argv[1]
host = argv[2]
port = argv[3]
ignored: set[str] = set()

gitignore = dotfiles / ".gitignore"
if gitignore.exists():
    lines = gitignore.read_text().splitlines()
    lines.extend([".git", ".gitignore"])
    for line in lines:
        if line.startswith("#"):
            continue

        if line == "":
            continue

        path = dotfiles / line
        if path.exists() and path.is_file():
            ignored.add(str(path))
        else:
            print(line)
            files = set(str(e) for e in list(dotfiles.glob(f"{line}/**/*")))
            ignored = ignored.union(files)


def scp_file(file: Path):
    path_parts = file.parts[3:]
    remote_path = "/".join(list(path_parts))
    remote = f"{user}@{host}:/home/{user}/{remote_path}"
    args = ["scp", "-P", str(port), str(file), remote]
    # print(f"{' '.join(args)}")
    proc = run(args)
    if proc.returncode != 0:
        raise Exception(f"scp failed: {proc.returncode} {proc.stderr.decode()}")  # noqa
    else:
        stdout = "" if proc.stdout is None else proc.stdout.decode()
        if stdout != "":
            print(f"{stdout=}")
        stderr = "" if proc.stderr is None else proc.stderr.decode()
        if stderr != "":
            print(f"{stderr=}")


for file in dotfiles.glob("**/*"):
    if file.is_dir():
        continue

    if str(file) in ignored:
        continue

    try:
        scp_file(file)
    except Exception as e:
        print(f"error: {e}")
print("finish")
