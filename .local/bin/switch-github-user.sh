#!/bin/bash
gh_user="${1:-Nothing}"

if [ "$gh_user" == 'USERNAME_1' ]; then
	ssh-add -D
	git config --global user.email "USERNAME_1_EMAIL"
	ssh-add /PRIVATE_KEY_PATH/.ssh/github-USERNAME_1
elif [ "$gh_user" == 'USERNAME_2' ]; then
	ssh-add -D
	git config --global user.email "USERNAME_2_EMAIL"
	ssh-add /PRIVATE_KEY_PATH/.ssh/github-USERNAME_2
else
	echo 'Nothing was applied'
	exit 1
fi
echo "$gh_user applied!"
git config user.email
ssh -T git@github.com
exit 0

# TO USE
# ./switch-github-user.sh USERNAME_1
