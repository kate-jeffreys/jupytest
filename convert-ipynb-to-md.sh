#! /bin/zsh

source .venv/bin/activate
jupytext jupytest.ipynb --to md --output _jupytest.md --update-metadata '{"jupytext": {"notebook_metadata_filter":"-all"}}'