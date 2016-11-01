#!/usr/bin/env bash
path="/Users/sijinhe/PhpstormProjects/FederatedGitWiki"
markdownFolder="$path/wiki-markdown"
htmlFolder="$path/wiki-html"
gitList="$path/conf/gitList.txt"
extension=".html"

mkdir -p $markdownFolder
mkdir -p $htmlFolder

cd $markdownFolder && rm -rf *

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
      mkdir -p "$htmlFolder/$dir" && markdown2 --extras fenced-code-blocks "$dir/$file" > "$htmlFolder/$dir/$filename"
      markdown2 --extras fenced-code-blocks "$dir/$file" > "$htmlFolder/$dir/$filename$extension"
    done
done