PKGNAME := $(shell sed -n "s/Package: *\([^ ]*\)/\1/p" DESCRIPTION)
PKGVERS := $(shell sed -n "s/Version: *\([^ ]*\)/\1/p" DESCRIPTION)
PKGSRC  := $(shell basename `pwd`)

all: rd readme check clean

alldocs: rd readme site

rd:
	Rscript -e 'library(methods); devtools::document()'

readme:
	Rscript -e 'rmarkdown::render("README.md")'

build2:
	cd ..;\
	R CMD build $(PKGSRC)

build:
	cd ..;\
	R CMD build --no-build-vignettes $(PKGSRC)

install:
	cd ..;\
	R CMD INSTALL $(PKGNAME)_$(PKGVERS).tar.gz

check: rd build
	cd ..;\
	Rscript -e 'rcmdcheck::rcmdcheck("$(PKGNAME)_$(PKGVERS).tar.gz")'

check2: rd build
	cd ..;\
	R CMD check $(PKGNAME)_$(PKGVERS).tar.gz

check3: rd build2
	cd ..;\
	R CMD check --ignore-vignettes $(PKGNAME)_$(PKGVERS).tar.gz

# bioccheck:
# 	cd ..;\
# 	Rscript -e 'BiocCheck::BiocCheck("$(PKGNAME)_$(PKGVERS).tar.gz")'

gpcheck:
	Rscript -e 'goodpractice::gp()'

clean:
	cd ..;\
	$(RM) -r $(PKGNAME).Rcheck/


# site:
# 	cd site_src;\
# 	ln -s ../../software/themes themes;\
# 	Rscript -e 'blogdown::build_site()';\
# 	rm themes;\
# 	cd ..

# preview:
# 	cd site_src;\
# 	ln -s ../../software/themes themes;\
# 	Rscript -e 'blogdown::serve_site()';\
# 	rm themes;\
# 	cd ..



# gitmaintain:
# 	git gc --auto;\
# 	git prune -v;\
# 	git fsck --full


# update:
# 	git fetch --all;\
# 	git checkout master;\
# 	git merge upstream/master;\
# 	git merge origin/master

# push: update
# 	git push upstream master;\
# 	git push origin master

