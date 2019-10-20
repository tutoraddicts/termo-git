#!/bin/sh
initialise_ids() {
	echo "Enter your github registered email address"
	read emailID
	git config --global user.email emailID
	echo "Enter your registered Git ID"
	read ID
	git config --global user.name ID
}
first_time() {
	echo "Initialising"
	git init
	echo "Inisialized"
	echo "Adding All your files"
	git add *
	initialise_ids
	echo "Want to show git status yes or no[y/n]"
	while :
	do
		read YorN
		case $YorN in 
			y)
				git status
				break
				;;
			n)
				echo "Good to go"
				break
				;;
			*)
				echo "Give a valid Input"
				break
				;;
	 esac
	done
	echo "Now creat a new Repo in your github"
	echo "If you done all ready, copy the URL"
	echo "and past the URL here and press enter to continue"
	read repo_URL
	echo "Enter your Commit details here example 'Firth Commit' or 'fixed this issue'"
	read commit_details
	git commit -e $commit_details
	git remote add origin $repo_URL
	git push -u origin master
	echo "Now we all done Check your repo in github"
}

second_time() {
	git add *
	echo "Enter your commit details"
	read commit_details
	git commit -e $commit_deatils
	echo "Pushing to branch master"
	git push -u origin master
	echo "We are all done"
}


echo "Welcome To the git project. There some simple steps you have to do here.So We will guid you through this."
echo "Press the desired number and press enter"
echo "1.Upload source to github first time."
echo "2.Upload source secod time."
echo "3.Clone old repo."
echo "4.Add File into your local repo"
echo "5.Remove File from your local repo"
while :
do
	read INPUT_NUMBER
	case $INPUT_NUMBER in 
		1)
			first_time
			break
			;;
		2)
			second_time
			break
			;;
		3) 
			echo "Feature Under Development"
			break
			;;
		4)
			echo "Feature Under Development"
			break
			;;
		5)
			echo "Feature Under Development"
			break
			;;
		*)
			echo "Enter proper number"
			;;
 esac
done
