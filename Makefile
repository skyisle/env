all: clean install 

clean:
	mkdir backup
	mv ~/.vim backup/
	mv ~/.vimrc backup/
	mv ~/.bashrc backup/
	mv ~/.bash_profile backup/

install:
	cp -R .vim ~/
	cp .vimrc ~/
	cp .bashrc ~/
	cp .bash_profile ~/
