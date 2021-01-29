setlocal foldmethod=indent
" Check Python files with flake8, pylint and mypy
let b:ale_linters = ['flake8', 'pylint', 'mypy']

" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['black', 'trim_whitespace', 'remove_trailing_lines']

" pylint options
" let b:ale_python_pylint_options = '--rcfile=/home/robert/smarkets/packages/smk_py_linting_utils/smk_py_linting_utils/pylintrc'
let b:ale_python_pylint_change_directory = 1

" flake8 options
let b:ale_python_flake8_options = "--max-line-length=110 --max-complexity=10 --jobs=auto --ignore=D1,W503,E201,E203"

" mypy options
let b:ale_python_mypy_options = "--ignore-missing-imports --follow-imports=silent"
let b:ale_python_mypy_ignore_invalid_syntax = 1
let b:ale_python_mypy_change_directory = 1

" black options
let b:ale_python_black_options = '--line-length 110 -t py38 '

" isort options
" let b:ale_python_isort_options = '--settings-path ~/smarkets/services/pyms/user/app/setup.cfg'
