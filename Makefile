PATHOGEN="http://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim"

install : pathogen.vim submodule-init
	ln -fs $(CURDIR)/vimrc $(HOME)/.vimrc && ln -fs $(CURDIR)/gvimrc $(HOME)/.gvimrc 

pathogen.vim : 
	rm -f autoload/pathogen.vim && wget -qP autoload $(PATHOGEN)

submodule-init :
	cd $(HOME)/.vim && git submodule update --init
