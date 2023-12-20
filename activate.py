from pathlib import Path
import sys

python_version = Path.cwd() / ".python-version"
scripts = list(Path.cwd().glob("**/activate"))


if scripts:
    if len(scripts) == 1:
        venv_script = scripts[0]
        print(venv_script)
    else:
        print("multiple venv scripts found", file=sys.stderr)
else:
    if python_version.exists():
        venv = python_version.read_text().strip()
        pyenv_script = f"/Users/bikmaev/.pyenv/versions/{venv}/bin/activate"
        print(pyenv_script)
    else:
        print("no `.python-version` found", file=sys.stderr)
