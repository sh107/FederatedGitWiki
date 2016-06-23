#!/usr/bin/env bash
markdownFolder="../wiki-markdown"
htmlFolder="../wiki-html"
gitList="../conf/gitList.txt"

mkdir -p $markdownFolder
mkdir -p $htmlFolder

cd $markdownFolder && rm -r *

while IFS= read line
do
    git clone "$line"
done <"$gitList"

for dir in `ls ./`;
do
    for file in `ls ./$dir`;
    do
      filename="${file%.*}"
      mkdir -p "$htmlFolder/$dir" && markdown2 "$dir/$file" > "$htmlFolder/$dir/$filename"
    done
done

