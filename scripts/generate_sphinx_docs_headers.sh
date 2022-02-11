#!/bin/bash

get_current_file_directory() {
    file_abs_path="$(readlink -f "${BASH_SOURCE[0]}")"
    directory_path="$(dirname "${file_abs_path}")"
    echo "${directory_path}"
}

root=$(dirname "$(get_current_file_directory)")
docs_path="$root"/docs/api_sphinx
src_path=$root/src

rm -r "$docs_path"
poetry run sphinx-apidoc \
    -d 2 \
    -H "Optext" \
    --separate \
    --follow-links \
    --full \
    -o "$docs_path" \
    -s rst \
    "$src_path" \
    "$src_path"/**/*_test.py \
    "$src_path"/**/tests/ \
    "$src_path"/**/test_*.py \
    "$src_path"/**/_test_*.py \
    "$src_path"/scripts/

poetry run python "$root"/scripts/generate_sphinx_conf.py \
    --sphinx-docs-path="$docs_path"
# full options
# https://www.sphinx-doc.org/en/master/man/sphinx-apidoc.html
