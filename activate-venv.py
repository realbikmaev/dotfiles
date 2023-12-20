from pathlib import Path
import sys

version_file = Path.cwd() / ".python-version"

if version_file.exists():
    venv = version_file.read_text().strip()
    activate = f"/Users/bikmaev/.pyenv/versions/{venv}/bin/activate"
    # TODO another activate is asually in project root
    print(activate)
else:
    print("no `.python-version` found", file=sys.stderr)
