#!/bin/zsh

outDir=$1

if [ ! -d "$outDir" ]; then
    mkdir "$outDir"
fi

for fileName in `ls notes/*.cson`; do
    title=`gsed -n "/^title:/p" "$fileName" | head -1 | gsed -e "s/title:\s\"\(.*\)\"$/\1/"`
    echo "`gsed -n "/^content:\s'''$/,/^'''$/p" $fileName | gsed '1d' | gsed '$d' | cut -b 3-`" \
      > "$outDir/$title.md"
    echo "$title.md file created."
done
