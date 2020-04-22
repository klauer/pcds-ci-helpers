#!/bin/bash

echo "===================================================="
echo "Running this library's configured pre-commit checks."
echo "See https://pre-commit.com/ for more information."
echo "===================================================="

pip install pre-commit
pre-commit install
pre-commit run --all-files
PRE_COMMIT_EXIT_CODE=$?

if [ $PRE_COMMIT_EXIT_CODE -ne 0 ]; then
    echo "====================================================================="
    echo "WARNING: One or more pre-commit checks have failed!"
    echo "This means you do not have pre-commit set up in your local checkout!"
    echo "See https://github.com/pcdshub/pre-commit-hooks/blob/master/README.md"
    echo "or use the above output and the following diff to fix the issues"
    echo "manually:"
    echo "====================================================================="
    echo "git diff:"
    git diff
fi

exit $PRE_COMMIT_EXIT_CODE