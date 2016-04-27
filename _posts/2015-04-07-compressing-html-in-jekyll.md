---
layout:     post
title:      Compressing HTML in Jekyll without a plugin
date:       2015-04-07 14:30:00
categories: jekyll
---

For a couple of years this site has been hosted on the excellent [Squarespace](http://squarespace.com), but it has always been on my to-do list to create something simple and static. Last week I took the plunge and everything is now up and running using [Jekyll](http://jekyllrb.com/) hosted on [GitHub Pages](https://pages.github.com/)..

I was keen on keeping the site as lightweight as possible, but I assumed some performance tweaks like minifying html would be impossible without plugins (which don't work on GitHub hosted sites). 

That changed when I stumbled across [jekyll-compress-html](https://github.com/penibelst/jekyll-compress-html), a jekyll layout that minifies HTML using pure Liquid, which means it works perfectly when building on GitHub Pages. 

Using it is dead simple, simply download compress.html, save it in `_layouts`, and update your base layouts to reference it:

```
---
layout: compress
---
```

The compression behaviour is configured in `_config.yml`. The full set of options are detailed in the [documentation](http://jch.penibelst.de/), but mine looks like this:

```
compress_html:
  clippings: all
  comments:  ["<!-- ", " -->"]
  endings:   all
```

Digging into the source, the magic is achieved by capturing the content of the page into a variable

```
{% raw %}
{% capture _content %}{{ content }}{% endcapture %}
{% endraw %}
```

followed by a bunch of string manipulation using `split`, `remove` and `replace`. For an example of the results you can view the source on this page.

This is a brilliant hack, and a great reminder of the power that Jekyll provides out of the box - you might not always need to reach for a plugin!