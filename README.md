# jupytest

Testing a way to convert between .md and .ipynb.

## Setup

### Pre-requisites

* Set up a local SigTech development environment.
* Make sure you have these Brew packages (probably covered by the above but just in case):
  * cmake
  * docutils
  * gh
  * git
  * jinja2-cli
  * jq
  * jupyterlab
  * make
  * sphinx-doc

### Clone and install

Clone this repo:

```shell
git clone https://github.com/kate-jeffreys/jupytest
```

Install stuff:

```shell
cd jupytest
chmod +x install.sh
chmod +x convert-ipynb-to-md.sh
chmod +x convert-md-to-ipynb.sh
./install.sh
```

## Try the conversions

### Markdown to Notebook

Convert the example Markdown file, `jupytest.md`, to Notebook format:

```shell
./convert-md-to-ipynb.sh
```

Results:

* Output file: `_jupytest.ipynb`.
* Copy of output file with modified file extension: `_jupytest._ipynb`. This is purely for my convenience because I couldn't find a way to make VSCode show the raw JSON when the file has an `.ipynb` extension.

The `convert-md-to-ipynb.sh` script produces output files that have been cleaned up the same way we clean the framework repo notebooks (deletes cell and notebook metadata garbage; removes output cells and execution counts).

### Notebook to Markdown

Convert the example Notebook file, `jupytest.ipynb`, to Markdown format:

```shell
./convert-ipynb-to-md.sh
```

Results:

* Output file: `_jupytest.md`.

The script omits the YAML frontmatter that jupytext adds by default; I found that conversion (including round-trip conversion) from Markdown to Notebook works fine without it.

## Compare the results

Compare the input and output Markdown files:

```shell
git diff --no-index jupytest.md _jupytest.md
```

Compare the input and output Notebook files:

```shell
git diff --no-index jupytest.ipynb _jupytest.ipynb
```