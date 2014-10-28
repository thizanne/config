#!/bin/sh
SERVER=cudf-solvers.irill.org
case $1 in
    -v) echo "Solver Farm at $SERVER client version 0.1"; exit 0;;
    *)
        if [ $# -lt 3 ]; then
            echo "Usage: $0 <input> <output> <criteria>"; exit 1
        fi
esac

IN=$1
OUT=$2
CRIT=$3

if type bzip2 >/dev/null; then
    ( bzip2 -c "$IN" | curl -f --data-binary @- "http://$SERVER/cudf.bz2?criteria=$CRIT" | bunzip2 -c > "$OUT" ) || echo FAIL > "$OUT"
else
    curl -f --data-binary @"$IN" -o "$OUT" "http://$SERVER/cudf?criteria=$CRIT" || echo FAIL > "$OUT"
fi
