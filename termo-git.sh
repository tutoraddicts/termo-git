#!/bin/sh
#<><><><><><><><><><><><><><><><><><><><><><><>
#Terminal Programe Git Hub known as TERMO-git
#<><><><><><><><><><><><><><><><><><><><><><><>
Identification() {
    username=$(git config --global user.name)
    emailid=$(git config --global user.email)

    if [ -z "$username" ]
    then 
        echo "Your Git email id and user id are not Present in your computer"
        echo "So Enter What we asked :) "
        echo ""
        initialise_ids
    else
        main_program    
    fi
}
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><>
# main program is for just selecting what user want to do
# we use switch case under infinite while loop
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><>
main_program() {
echo "* Press the desired number and press enter *\n"
echo "1. Upload source to Github."
echo "2. Sync with Github."
echo "3. Clone old repo."
echo "4. Remove File from your local repo"
echo "5. Add File into your local repo"
echo "6. Exit Termo Git\n"

while :
do
	read -p "-: " INPUT_NUMBER
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
			clone
			break
			;;
		4)
			remove
			break
			;;
		5)
			add
			break
			;;
		6)
			clear
			exit 0
			break
			;;
		*)
			echo "Enter proper number"
			;;
 esac
done
}
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
#Function for globally initialise you EMAIL_ID and USER_NAME
# read emailID -> Reading email id and storing in emailID variable
# it config --global user.email emailID -> code foe config email id
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

initialise_ids() {
	echo "Enter your github registered email address"
	read emailID
	git config --global user.email $emailID
	echo "Enter your registered Git ID"
	read ID
	git config --global user.name $ID
    
    main_program
}

#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>><><><><><><><><><><><><><><><><><>
# Function for initialise the git repo for first time
# git init -> is for initialise local git repo
# git add * for updating all the files in the repo
# Then we use a while look lop to ask you that you want to see the git status or not
# git commit -e commit -> this command used to initialise commitment of git
# git remote add origin $repo_URL -> this command and the repo link  the local git repo
# git push -u origin master -> finally we are uploading or can say pushing the files into the git repo
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>><><><><><><><><><><><><><><><><><>

first_time() {
	echo "Initialising"
	git init
	git add *.*
    git add *
	echo "Inisialized"
	echo "Adding All your files"
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
	echo "* Now creat a new Repo in your github *"
	echo "* If you done all ready, copy the URL *"
	echo "* Past the URL here and press enter to continue *"
	read repo_URL
	git commit -a
	git remote add origin $repo_URL
	git push -u origin master
	echo "Now we all done Check your repo in github"
	main_program
}

second_time() {
    git init
	git add *.*
    git add *
    git add -A
	git commit -a
	echo "Pushing to branch master"
	git push -u origin master
	echo "We are all done"
	main_program
}

#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
# This clone function represent the 3rd feature of our programe
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
clone() {
	echo "* Enter your repository link *"
	read repo_link
	if [ -z "$repo_link" ] 
	then
		echo "* Enter Link and then press enter *"
		clone
	else
		git clone $repo_link

	fi
		
	main_program
}

remove() {
	echo "So a window will popup and then select the files you want to remove from git repo"
	echo "Want To delet File from git Repo? Insert Yes or No [y/n] : "
	read yorn
	while :
	do
		case $yorn in
			y)
				filenames=$(zenity --file-selection --title "Termo Git")
				git rm --cached $filenames
				break
				;;
			n)	
				clear
				main_program
				break
				;;
			*)
				echo "Enter a valid Input"
				;;
		esac
		done
	#git status
	main_program
}

add() {
	echo "Select the file you want to add into your local git repo"
	echo -n "Press Yess or no [y/n] : "
	read yorn
	while :
	do
		case $yorn in
			y)
				filename=$(zenity --file-selection --title "Termo Git")
				git add $filename
				break
				;;
			n)
				break
				;;
			*)
				echo "Enter a valid Input"
				break
				;;
		esac
		done
	main_program
}
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
# This is deafault call when ever I am going to run my programe
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
Identification
