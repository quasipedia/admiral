# /bin/bash
# builds documentation and pushes it to GitHub Pages

# only committed changes must be documented!
git stash

# make a clean build of the html files and moves it out of the way
rm -Rf _build/
mkdir _build
make html
mkdir /tmp/admiral-docs
cp -R _build/html/* /tmp/admiral-docs/
rm -Rf _build/

# switch to GitHub pages repository and imports the build
cd ..
git checkout gh-pages
rm -Rdf *
cp -R /tmp/admiral-docs/* .
rm -Rf /tmp/admiral-docs

# track changes and pushes them to the server
git add *.html *.js objects.inv _static/* _sources/*
git commit -m "automatic documentation sync"
#git push

# revert to normal editing mode
git checkout master
git stash pop
