#!/usr/bin/env bash

# Task 07: complete this script.
# Usage: ./scripts/analyze.sh FILE

# TODO: validate arguments
# TODO: validate file existence
# TODO: print:
# Total ERROR: <number>
# Top Code: <code>
#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "need one file argument"
    exit 1
fi

FILE="$1"

if [ ! -f "${FILE}" ]; then
    echo "file not found"
    exit 1
fi

ERROR_COUNT=$(grep 'ERROR' "${FILE}" | wc -l)
TOP_CODE=$(grep 'ERROR' "${FILE}" | grep -o 'code=[0-9]*' | sed 's/code=//' | sort | uniq -c | sort -nr | head -n1 | awk '{print $2}')

echo "Total ERROR: ${ERROR_COUNT}"
echo "Top Code: ${TOP_CODE}"
