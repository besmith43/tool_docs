#!/bin/bash

#
# PROBLEM: pandoc generated pdf doesn't like gifs
# Current Solution: remove all lines containing the word 'gifs' with the following command:
# sed '/gifs/d' $file

# setup

if [ ! -f $(which gum) ]; then
	echo you are missing gum, please install it before continuing
	exit 1
fi

INFOLOG="gum log -l info -t datetime"
ERRORLOG="gum log -l error -t datetime"
CWD=$(pwd)

content_dirs=$(find . -mindepth 1 -maxdepth 1 -type d -not -path "./assets" -not -path "./dist" -not -path "./.git")

if [ ! -f $(which pandoc) ]; then
	$ERRORLOG "you are missing pandoc, please install it before continuing"
	exit 1
fi

if [ -d dist ]; then
	$INFOLOG "removing old dist directory"
	rm -r dist
fi

if [ ! -d dist ]; then
	$INFOLOG "making dist directory"
	mkdir dist
fi

# end setup

cd dist

$INFOLOG "creating a title page"

cat << EOF > title.txt
---
title: CLI Tools and How to use them
author: Blake Smith
rights:  Creative Commons Non-Commercial Share Alike 3.0
language: en-US
...
EOF

# echo $content_dirs

for content_dir in $content_dirs
do
	# $INFOLOG "copying $content_dir to dist directory"
	# cp -r ../$content_dir .

	# $INFOLOG "deleting gifs and updating asset reference paths"
	# find $content_dir -name *.md -exec sed '/gifs/d' {} > {} \;
	# find $content_dir -name *.md -exec sed 's/\/assets/..\/..\/assets/g' {} > {} \;
	
	content_dir=$(echo $content_dir | sed 's/.\///g')

	$INFOLOG "working on $content_dir"

	files=$(find ../$content_dir -mindepth 1 -maxdepth 1 -type f)

	mkdir $content_dir

	for file in $files
	do
		$INFOLOG "working on $file"

		if [[ "$file" == *".DS_Store"* ]]; then
			$INFOLOG "skipping $file"
			continue
		fi

		# file=$(cut -d '/' -f 3 "$file")
		file=$(echo "$file" | cut -d '/' -f 3)

		# echo "cat ../$content_dir/$file | sed '/gifs/d' | sed 's/\/assets/...\/.\/assets/g' > $content_dir/$file"
		# cat ../$content_dir/$file | sed '/gifs/d' | sed 's/\/assets/..\/..\/assets/g' > $content_dir/$file
		cat ../$content_dir/$file | sed '/\/gifs\//d' | sed 's/\/assets/..\/assets/g' > $content_dir/$file
	done
done

$INFOLOG "building pdf"

pandoc -o ../tools.pdf title.txt \
	bash/*.md \
	readline/*.md \
	link/*.md \
	ssh/*.md \
	sftp/*.md \
	scp/*.md \
	sshmount/*.md \
	git/*.md \
	gum/*.md \
	freeze/*.md \
	vhs/*.md \
	fzf/*.md \
	tar/*.md \
	zip/*.md \
	unzip/*.md

$INFOLOG "building epub"

pandoc -o ../tools.epub title.txt \
	bash/*.md \
	readline/*.md \
	link/*.md \
	ssh/*.md \
	sftp/*.md \
	scp/*.md \
	sshmount/*.md \
	git/*.md \
	gum/*.md \
	freeze/*.md \
	vhs/*.md \
	fzf/*.md \
	tar/*.md \
	zip/*.md \
	unzip/*.md


# cleanup

$INFOLOG "starting cleanup"
$INFOLOG "changing to $CWD"
cd $CWD

if [ -d dist ]; then
	$INFOLOG "deleting dist directory"
	rm -r dist
fi

# end cleanup

