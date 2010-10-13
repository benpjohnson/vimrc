PATHOGEN="http://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim"

install : pathogen.vim
	ln -fs $(CURDIR)/vimrc $(HOME)/.vimrc && ln -fs $(CURDIR)/vimrc $(HOME)/.gvimrc 

pathogen.vim : 
	rm -f autoload/pathogen.vim && wget -qP autoload $(PATHOGEN)
