---
layout:     post
title:      Inlining SCSS in Jekyll
date:       2015-04-07 14:30:00
categories: jekyll
---

When trying to squeeze extra milliseconds off your page load times, one useful technique is embedding css into pages directly, rather than loading it via a `link` tag

[Optimising the delivery of style sheets](https://developers.google.com/speed/docs/insights/OptimizeCSSDelivery)


#Resources


Why inlining css is important
https://developers.google.com/speed/docs/insights/OptimizeCSSDelivery

mention it should probably only be done for critical styles? (above the fold)

Release notes from august

http://jekyllrb.com/docs/history/#v2-3-0

Mention why this is easy with css files, but scss requires a little trickery

```
    {% raw %}
    <style type="text/css">
    {% capture raw_scss %}
        {% include critical.scss %}
    {% endcapture %}
    {{ raw_css | scssify }}
    </style>
    {% endraw %}
```

scss must go in includes folder, can still reference things in _sass

dont put frontmatter, prevents errors