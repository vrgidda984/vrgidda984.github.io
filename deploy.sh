# GitHub username.
USERNAME=vrgidda984
# Name of the branch containing the Hugo source files.
SOURCE=hugo
# The commit message.
MESSAGE="Site rebuild $(date)"

msg() {
    printf "\033[1;32m :: %s\n\033[0m" "$1"
}

msg "Pulling down the \`master\` branch into \`public\` to help avoid merge conflicts"
git subtree pull --prefix=public \
    https://github.com/vrgidda984/vrgidda984.github.io.git origin master -m "Merge origin master"

msg "Building the website"
hugo

msg "Pushing the updated \`public\` folder to the \`source\` branch"
git add public
git commit -m "$MESSAGE"
git push origin "source"

msg "Pushing the updated \`public\` folder to the \`master\` branch"
git subtree push --prefix=public \
    https://github.com/vrgidda984/vrgidda984.github.io.git master
