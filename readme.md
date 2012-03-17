# jekyll-lair

jekyll-lair is a template to use when you're starting out using [jekyll](http://jekyllrb.com) for a static only project. It's pretty opinionated, and may not be for everybody, but, seeing as how it provides almost no functionality of it's own, that's probably not a bad thing.

## What is it?

jekyll-lair constists of a particular directory layout, a couple pre-included plugins (mostly from the list at the [jekyll prject's wiki](https://github.com/mojombo/jekyll/wiki/Plugins)), and a Rakefile to manage simple steps, like starting a preview server, etc, etc.

### Opinions

* [**scss**](http://sass-lang.com/) for stylesheets
* [**coffeescript**](http://coffeescript.org/) for javascript
* the base html is from [**HTML5 Boilerplate**], and then cut way down. 

---

I use a couple specific plugins in almost every project I run, so they're included here. A good number of them come from the various gists linked to in the [jekyll project's wiki page for plugins](https://github.com/mojombo/jekyll/wiki/Plugins). Credit is given where there's no explicit licence, and the license is included if there is. 

*If I'm using a plugin you wrote and you'd rather I not be, please let me know, I'll pull it.*

## Getting Started

1. **Get the project into directory.**
    
    You can download the [zipball](https://github.com/lygaret/jekyll-lair/zipball/source), or, from the commandline:

        $ git archive master | tar -x -C /your/projectdir

2. **Install required libraries.**

		$ bundle install
		
3. **Run the preview server.**

		$ rake preview
		
4. ***Profit!***