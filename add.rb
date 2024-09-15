require 'metainspector'
require 'stringex'

url = ARGV.first
page = MetaInspector.new url
title = page.title
slug = title.to_url
now = DateTime.now
path = "content/fr/signals/#{now.year}/#{slug}.md"
data = <<-TEXT
---
title: >-
  #{title}
date: "#{now.iso8601}"
source: #{url}
draft: true
tags:
---
TEXT

File.write path, data
