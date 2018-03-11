---
layout: post
title:  "DSM Tool Suite Overview"
date:   2018-03-11 14:59:22 +0100
categories: DSM
---

# Introduction

A design structure matrix can be used to visualize dependencies between hierarchically organized elements. It is useful to visualize the often complex dependencies between software elements.

# History

This tool set is based on the DSM Visual Studio addin found at https://github.com/tecsoft/dsm-vs-addin
This addin could be used to visualize dependencies between classes in .NET code.

This addin however had a few major restriction:
- The lastest supported version was Visual Studio 2012.
- Only .Net code was supported
- Analyzing dependencies could only be done from the user interface.

# Design Goals
The goals are:
- Standalone application instead
- Building dsm files can be integrated into automatic build.
- Allow visualization of software dependencies for commonly used languages.
# Design Overview

Inline-style: 
![alt text](https://dsmsuite.github.io/images/dsm_tool_suite_overview.png "DSM tool suite overview")

# Usage

## Analyzing dependencies

## Building the DSM file

## Viewing the DSM

## Manipulating the DSM

## Save the DSM

You’ll find this post in your `_posts` directory. Go ahead and edit it and re-build the site to see your changes. You can rebuild the site in many different ways, but the most common way is to run `jekyll serve`, which launches a web server and auto-regenerates your site when a file is updated.

To add new posts, simply add a file in the `_posts` directory that follows the convention `YYYY-MM-DD-name-of-post.ext` and includes the necessary front matter. Take a look at the source for this post to get an idea about how it works.

Jekyll also offers powerful support for code snippets:

# Image test


{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}

Check out the [Jekyll docs][jekyll-docs] for more info on how to get the most out of Jekyll. File all bugs/feature requests at [Jekyll’s GitHub repo][jekyll-gh]. If you have questions, you can ask them on [Jekyll Talk][jekyll-talk].

[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/
