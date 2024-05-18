# (REQUIRED) Development environment

Assuming you have the right Python version, you can create a virtual environment with all dependencies.

```sh
rm -rf venv-all
python3.12 -m venv venv-all

source venv-all/bin/activate
python -m pip install --upgrade pip
pip install --force-reinstall -r requirements.txt
```