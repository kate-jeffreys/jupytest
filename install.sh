#! /bin/zsh

python3 -m venv .venv
source .venv/bin/activate
echo "Using python $(python --version) in: $(which python)"

pip install --upgrade pip
pip install Sphinx==4.5.0
pip install myst-nb
pip install jupytext
pip install jupyter-book
pip install matplotlib
pip install myst-parser
pip install sphinx-book-theme
pip install pandas