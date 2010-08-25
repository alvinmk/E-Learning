if [ $# -ne 3 ]
	then
	echo "Usage: $0 [PATH] [string to replace] [replacement]"
	exit
fi
echo "replacing all occurences of $2 with $3 in the tree starting at $1"
echo "Are you sure you want to continue?"
read answer
if [ "$answer" = "y" ]
	then
		cd "$1" && find . -type f -print0 | xargs -0 perl -i.bak -pe "s/$2/$3/g"
fi


