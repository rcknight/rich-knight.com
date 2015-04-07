---
layout:     post
title:      Compressing HTML in Jekyll without plugins
date:       2015-04-07 14:30:00
categories: jekyll
---

For a couple of years this site has been hosted on the excellent [Squarespace](http://squarespace.com), but it has always been on my todo list to create something simple and static. Last week I took the plunge and everything is now up and running using [Jekyll](http://jekyllrb.com/) hosted on [Github Pages](https://pages.github.com/).

The site is now hosted on GitHub pages, which is free and simple, but comes with some limitations. The biggest of these is the inability to take advantage of the many excellent [plugins](http://jekyllrb.com/docs/plugins/) created by the Jekyll community.

I was keen on keeping the site as lightweight as possible, but I assumed some performance tweaks like minifying html beyond my reach without a plugin. That changed when I stumbled accross [jekyll-compress-html](https://github.com/penibelst/jekyll-compress-html) on Github. It minifies HTML using a pure Liquid layout, which means it works perfectly when building on Github Pages. You can see how the output looks by viewing the source on this page.

The usage is dead simple, simply download compress.html, stick it in your `_layouts` folder, and update your base level layout (usually `default.html`) to reference the new layout:

```
---
layout: compress
---
```

The compression behaviour is configured in your `_config.yml`. You can check out the full set of options in the [documentation](http://jch.penibelst.de/), but mine looks like this:

```
compress_html:
  clippings: all
  comments:  ["<!-- ", " -->"]
  endings:   all
```

Digging into the source, the magic is acheived by capturing the content of the page into a variable

```
{% raw %}
{% capture _content %}{{ content }}{% endcapture %}
{% endraw %}
```

followed by a bunch of clever string manipulation using `split`, `remove`, `replace` etc. This is a brilliant hack, and a great demonstration of the power that Jekyll provides plugin free.