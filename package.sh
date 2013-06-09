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

zip -r sproute-$1.zip * -x \*.git -x package\.sh -x \*.gitignore -x sproute/node_modules
