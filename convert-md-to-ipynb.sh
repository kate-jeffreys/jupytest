#! /bin/zsh

source .venv/bin/activate

rm -f _jupytest.ipynb
rm -f _jupytest._ipynb

jupytext jupytest.md --to ipynb --output _jupytest.ipynb

f=_jupytest.ipynb
tempfoo=`basename "$f"`
TMPFILE=`mktemp "${tempfoo}.XXXXXX"` || exit 1
jq --indent 1 \
'
(.cells[] | select(has("outputs")) | .outputs) = []
| (.cells[] | select(has("execution_count")) | .execution_count) = null
| del(.cells[] | select(has("id")) | .id)
| .metadata = {"language_info": {"name":"python", "pygments_lexer": "ipython3"}}
| .cells[].metadata = {}
' "$f" > "$TMPFILE"
mv "$TMPFILE" "$f"
echo "Finished cleaning $f"

cp _jupytest.ipynb _jupytest._ipynb