same_path() {
	echo "We are first initialising the git in to the folder"
	git init
	echo "then we are going to add files into git"
	git add *
	echo "It is your git status"
	git status
	echo "Now creat a new Repo in git copy the path and past here and press enter to continue"
	echo "Enter your Commit command here example 'Firth Commit'"
	read commit_command
	git commit -m $commit_command
	echo "Enter your repo URL here"
	read repo_URL
	echo $repo_URL
	git remote add origin $repo_URL
	git push -u origin master
	echo "Now we all done Check your repo in github"
}
echo "Welcome To the git project. There some simple steps you have to do here.So We will guid you through this."
echo "select any one those option"
echo "1.press 1 If you place the script into your project folder"
echo "2. press 2If you did not place script into your project path"
while :
do
	read INPUT_NUMBER
	case $INPUT_NUMBER in 
		1)
			same_path
			break
			;;
		2)
			echo "such a dumb"
			break
			;;
		*)
			echo "Enter proper number"
			;;
 esac
done
