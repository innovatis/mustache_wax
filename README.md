# handlebar_wax

## What is it?

HandlebarWax is a gem to let you easily share mustache templates between your server-side and client-side code. 

On the server, HandlebarWax uses code borrowed from handlebars-rails to support *.*.hbs as a template type (think foo.html.erb, foo.html.haml, foo.html.hbs). These work pretty much exactly like you would expect they should.

For the client side, HandlebarWax writes all your templates into public/javascripts/handlebars_templates.js, for you to use in your JavaScript code.

## How do I use it?

1. Add it to your gemfile.

`gem "mustache_wax"`

2. Add it to your layout (it's important that ":handlebar_wax" be a symbol, not a string)

`= javascript_include_tag 'stuff.js', 'things.js', :handlebar_wax`

This mostly includes javascripts/handlebars.js and javascripts/handlebars_templates.js.

3. Create view files.

`(app/views/users/_user.html.hbs)`

`\<h1>{{greeting}},  {{user/name}}!\</h1>`

4. Render views from rails.

`- @user = User.first`
`= render :partial => 'users/user', :locals => {:greeting => "Hello"}`

Note that in MustacheWax, hbs templates understand both assigns and locals.
    
5. Render views from JavaScript

`var user = Handlebars.compile(HandlebarsTemplates['users/_user']);`
`user({user: {name: "Why"}}, greeting: "Frabjous Day")`

## Who made this possible?

* Steven Soroka (ssoroka) for pub-based discussion about this, and initial mustache_wax code
* Jamesarosen for handlebars-rails, which this project includes in its entirety, with very few modifications as of yet.
* Yehuda Katz (wycats) for the wonderful Handlebars.js.

## I want to help / I have an idea.

* I'm all ears. Shoot me an email or a PM.

## Copyright

Copyright (c) 2011 Burke Libbey. See LICENSE.txt for further details.

