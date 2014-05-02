PATHOGEN="http://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim"

install : pathogen.vim submodule-init $(HOME)/.vimrc pman

update :
	git submodule foreach git pull origin master

pathogen.vim :
	rm -f autoload/pathogen.vim && wget --no-check-certificate -qP autoload $(PATHOGEN)

submodule-init :
	cd $(HOME)/.vim && git submodule update --init

$(HOME)/.vimrc :
	ln -fs $(CURDIR)/vimrc $(HOME)/.vimrc && ln -fs $(CURDIR)/gvimrc $(HOME)/.gvimrc 

commandt :
	   cd $(HOME)/.vim/bundle/command-t/ruby/command-t && ruby extconf.rb && make

pman :
	sudo pear install doc.php.net/pman
