# BOBLIN

## Getting started

We have a Trello board where we are tracking the project at: https://trello.com/b/1VPJanSV/development

### Setting up a dev environment on windows

1. Set up Linux on windows with: 
https://cepa.io/2018/02/10/linuxizing-your-windows-pc-part1/
You can skip “Getting a Decent Terminal”, Docker with WSL, Vagrant with WSL

2. Set up an SSH key with ubuntu - 
https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key

Additional notes on SSH for github - 
https://jdblischak.github.io/2014-09-18-chicago/novice/git/05-sshkeys.html

3. Clone the project from Github
git clone git@github.com:shawnaldridge/boblin.git

4. Install Sublime text
https://linuxize.com/post/how-to-install-sublime-text-3-on-ubuntu-18-04/

To verify that sublime is properly installed in your terminal type
`subl .`

## Heroku

The application is hosted on Heroku. The process for deploying new code is documented here:
https://devcenter.heroku.com/articles/git

##Git process
We are going to keep git processes as simple as possible. For collaboration sake when you're doing work you should create your own branch.

1. First make sure you're up to date with the master branch
`git pull origin master`

2. Check out your own branch with a name related to what you're doing. For this work I might name my branch "readme"
`git checkout -b readme` #Note the `-b` flag tells git to create a new branch with this name if one doesn't already exist

3. Make your changes to the code

4. Add and commit these changes to your branch
`git status` #This shows you the current changes you have made
`git add .` #This adds all changes visible from your current directory
`git commit -m "This is where your commit message describing your changes goes"`
`git push origin readme` #This pushes your changes up to github with your current branch name

5. Navigate to github in your browser and click the "New Pull Request" button. You'll want to make the first branch "master" and the second branch your branch name, in this case "readme".

6. You can either merge the changes yourself after you look over the pull request and make sure that's what you want, or you can have someone else review them for sanity sake.

7. After the pull request is merged the master branch will be updated, and you will need to re-pull master with 
`git pull origin master`

## Design

Auto-magical NPC generator

Initial model design:

Npc will be our base class, it is essentially just a collection of other attributes, allowing for random generation

npc belongs to:
name
pronoun
race
personality

## Architecture

We will want these different attributes to be fetched at load time from S3, AWS's Simple Storage Service (analgous to google cloud storage). This will allow us to change attribute lists (like lists of names) on the fly without doing a new deployment of the code. 