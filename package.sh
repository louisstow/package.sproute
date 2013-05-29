# ensure latest sproute
cd sproute
git checkout master
git pull origin master
cd ..

# ensure latest docs
cd docs
git reset --hard
git pull origin master

# loop over ever markdown file
for i in *.md; do
	filename=${i%.*}
	pandoc -f markdown -t html "$i" -o "$filename.html"
done;

# remove all markdown
rm *.md
rm *.sprt
rm build.sh
cd ..

echo $1 > version.txt

rm -rf sproute/node_modules

zip -r sproute * -x \*.git -x package\.sh -x \*.gitignore
