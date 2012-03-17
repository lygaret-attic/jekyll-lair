*None of this works yet. I write readmes to guide development.*

# jekyll-lair

jekyll-lair is a template to use when you're starting out using [jekyll](http://jekyllrb.com) for a static website project. It's pretty opinionated, and may not be for everybody, but, seeing as how it provides almost no functionality of it's own, that's probably not a bad thing.

## What is it?

It's about 30 minutes worth of work that you don't have to do.

jekyll-lair constists of a particular directory layout, a couple pre-included plugins (mostly from the list at the [jekyll project's wiki](https://github.com/mojombo/jekyll/wiki/Plugins)), and a Rakefile to manage simple steps, like starting a preview server, etc, etc.

Importantly, it's not a framework. It doesn't include base styles, a template switcher, any jquery plugins, yahoo widgets or google+ buttons. Where there are common pieces of markup that get used a lot (google analytics), they're included in the `_includes` directory, but not in the default layout.

If you want something to build your blog off of, see the [Octopress](http://octopress.org) project.

### Opinions
*All of these are really easy to change; they're included simply by plugins that are in by default and some Rake tasks.*

* [**scss**](http://sass-lang.com/) for stylesheets
* [**coffeescript**](http://coffeescript.org/) for javascript
* [**jasmine**](http://pivotal.github.com/jasmine/) for BDD of javascript/coffeescript.
* the default layout is from [**HTML5 Boilerplate**](http://html5boilerplate.com), and then cut way down. 


## Why?

There's about seventeen steps I run through everytime I start out a new  project (usually static mockups). I'm tired of it. 

I use a standard markup base and a couple specific plugins in almost every project I run, so they're included here. A good number of them come from the various gists linked to in the [jekyll project's wiki page for plugins](https://github.com/mojombo/jekyll/wiki/Plugins). Credit is given where there's no explicit licence, and the license is included if there is. 

*If I'm using a plugin you wrote and you'd rather I not be, please, let me know so I can pull it.*

### What about Octopress?

The *excellent* [Octopress](http://octopress.org) project is great for running a blog, and if that's your goal, I'd highly recommend looking at it before using jekyll-lair. It feels way too heavy for something that's not a blog though, and most of my static projects end up pulling more than half of what's there.

Plus, where there's a will, there's a `git init`.


## Getting Started

1. **Get the project into directory.**
    
    This isn't a project you clone. You can, if you'd like to contribute a fix for something (hint hint), but in general, this is a template you 
    You can download the [zipball](https://github.com/lygaret/jekyll-lair/zipball/master), or, from the commandline:

        $ wget https://github.com/lygaret/jekyll-lair/tarball/master | tar -xz .

2. **Install required libraries.**

		$ bundle install
		
3. **Run the preview server.**

		$ rake preview
		
4. ***Profit!***

	Visit [http://localhost:9292/](http://localhost:9292/), and you should see the base 


## Standard Rakefile targets

* `rake preview`

	starts jekyll and a rackup server, making the site you're working on available at [http://localhost:9292/](http://localhost:9292/).
	
	You can configure the preview server using the `_config.yml` file. In particular, see the `lair.preview` section.

* `rake archive`

	generates an archive of the `_public` directory of the site, placing it at public_archive.tgz. 
	
	To change the location where the archive is saved, or change the archive to be a zipfile rather than a tarball, change the `lair.archive` object in `_config.yml`.

* `rake generate page <Page Title>`

	Creates a new markdown file in the source directory, named a slugged version of the page title given. The title can be preceded by a directory path and the parent directories will also be created. 
	
	The generated markdown will have standard yaml front matter prepended. You can change what front matter will be included by changing the `liar.generate.page` object in `_config.yml`.
	
* `rake generate post <Post Title>`

	Creates a new markdown file in the `_posts` directory named appropriately for jekyll's post management. The generated file will have the standard yaml front matter for posts prepended. You can change what front matter will be included by changing the `liar.generate.page` object in `_config.yml`.


## Hosting on Github Pages

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