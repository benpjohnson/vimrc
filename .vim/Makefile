PATHOGEN="http://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim"

install : pathogen.vim  $(HOME)/.vimrc pman

pathogen.vim :
	rm -f autoload/pathogen.vim && wget --no-check-certificate -qP autoload $(PATHOGEN)

$(HOME)/.vimrc :
	ln -fs $(CURDIR)/vimrc $(HOME)/.vimrc && ln -fs $(CURDIR)/gvimrc $(HOME)/.gvimrc 

pman :
	sudo pear install doc.php.net/pman

neovim-python :
	sudo pip install neovim
