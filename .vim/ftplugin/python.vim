" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint', 'mypy', 'isort']

" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['black', 'isort']

" pylint options
let b:ale_python_pylint_options = '--rcfile =/home/robert/smarkets/packages/smk_py_linting_utils/smk_py_linting_utils/pylintrc'

" flake8 options
let b:ale_python_flake8_options = "--max-line-length=110 --max-complexity=10 --jobs=auto --import-order-style=smarkets --application-import-names=routes,run,tests,user,payment,notification,forex,fraud,auth,chat,mm-api,api,stream-api,tickets,odds-feed,email,exclusions,conftest,json_schemas --sql-excepted-names=checked,comment,count,session,state,timestamp,source --ignore=D1,W503,E201"

" mypy options
let b:ale_python_mypy_options = "--ignore-missing-imports --follow-imports=silent --disallow-untyped-defs"
"
" black options
let b:ale_python_black_options = '--line-length 110 --py36 '
"
" isort options
let b:ale_python_isort_options = '--settings-path ~/smarkets/services/pyms/user/app/setup.cfg'
