source venv.sh

pip install psycopg2-binary tabulate

ORIGINAL_FOLDER=$(pwd)

# Make sure all the shit is installed
while read p; do
	pip list --format freeze | cut -f 1 -d "=" | grep -q "bio2bel-$p"
	if [ "$?" -eq 0 ] ; then
		echo "🅱️  bio2bel_$p already installed"
		
	elif [ -d "$HOME/dev/bio2bel/" ]; then
		cd "$HOME/dev/bio2bel/"
		if [ ! -d "$p" ]; then
			git clone "https://github.com/bio2bel/$p.git"
		fi
		cd "$HOME/dev/bio2bel/$p"
		git pull
		echo "🅱️  installing bio2bel_$p from $HOME/dev/bio2bel/$p"
		pip install -qe .
	
	elif [ -d "$HOME/dev/" ]; then
		cd "$HOME/dev"
		if [ ! -d "$p" ]; then
			git clone "https://github.com/bio2bel/$p.git"
		fi
		cd "$HOME/dev/$p"
		git pull
		echo "🅱️  installing bio2bel_$p from $HOME/dev/$p"
		pip install -qe .
	
	else
		echo "🅱️  no $HOME/dev folder available"
		echo "🅱️  installing bio2bel_$p from GitHub"
		pip install -q "git+https://github.com/bio2bel/$p.git"
	
	fi
done < requirements.txt

cd $ORIGINAL_FOLDER
unset ORIGINAL_FOLDER
