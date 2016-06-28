#!/usr/bin/env bash
path="/Users/sijinhe/PycharmProjects/FederatedGitWiki"
markdownFolder="$path/wiki-markdown"
htmlFolder="$path/wiki-html"
gitList="$path/conf/gitList.txt"

mkdir -p $markdownFolder
mkdir -p $htmlFolder

cd $markdownFolder && rm -r *

echo $gitList

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