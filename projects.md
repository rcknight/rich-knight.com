---
layout: page
title: Projects
permalink: /projects/
---

<div class="home">
  <div class="posts">
    {% for post in site.projects %}
      <div class="post">
        <a href="{{ post.url | prepend: site.baseurl }}" class="post-link">
          <h3 class="h3 post-title">{{ post.title }}</h3>
          <p class="post-summary">{{ post.content }}</p>
        </a>
      </div>
    {% endfor %}
  </div>
</div>
