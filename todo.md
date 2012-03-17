# TODO

1. `rake generate` et al
2. All the ghpages stuff
3. Is there a way to hide all the extra stuff, like it's a submodule, so we can keep the Rakefile and Gemfile updated?

# Not finished readme sections

## Rake Targets

* `rake generate page <Page Title>` (*incomplete*)

	Creates a new markdown file in the source directory, named a slugged version of the page title given. The title can be preceded by a directory path and the parent directories will also be created. 
	
	The generated markdown will have standard yaml front matter prepended. You can change what front matter will be included by changing the `liar.generate.page` object in `_config.yml`.
	
* `rake generate post <Post Title>` (*incomplete*)

	Creates a new markdown file in the `_posts` directory named appropriately for jekyll's post management. The generated file will have the standard yaml front matter for posts prepended. You can change what front matter will be included by changing the `liar.generate.page` object in `_config.yml`.


## Hosting on Github Pages (*incomplete*)

jekyll-lair has a couple convience options if you're using the generator to host on github pages, including a branch strategy for pushing the public folder to your repo's master branch while keeping the source in a seperate branch.

To use gh-pages support, edit the `lair.ghpages` section in `_config.yml`, and run `rake ghp-init `. 

***Caution, this screws with your `.git` directory, by creating a branch, switching branches on your working copy and initing and adding a submodule.*** It's best to do this only on an empty directory, and a completely clean `<youruser>.github.com` repository. I take no responsibility for screwing up your computer, your repository, your golf handicap, github's data center, an amazonian butterfly colony or anything else, real or imagined.
    
### GitHub Pages Specific Rakefile targets

* `rake ghp-init`

	Sets up the current project for being pushed to github pages for hosting. Configure it using the `lair.ghpages` section in `_config.yml`. Once this is done, the following changs will have been made:
	
	* Your working copy will have been switched to a `source` branch. This is configurable by changing `lair.ghpages.source_branch`.
	* Your public directiory will be deleted, removed from git's control (if it was included), and readded as a submodule of the same repo on the `master` branch. This is configurable by changing `lair.ghpages.public_branch`.
	* Your site will be generated from the source folder, and added to the public folder (which is now the master branch of your repo). 
	* The public folder will be committed, deleting the old contents of the `master` branch, and adding the generated output of your site.
	
* `rake ghp-push`

	Commits and does a `git push` on the public submodule, pushing changes to github (or whereever your repo is maintained.)
	
* `rake ghp-deploy`
	
	Generates the site, and then does a `rake ghp-push`.