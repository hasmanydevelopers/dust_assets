# dust.js for the Rails asset pipeline

First of all! The credits goes to [handlebars_assets](http://github.com/leshill/handlebars_assets/) we used this gem as a base for `dust_assets`. 
The `dust_assets` gem allows you to use dust.js templates within Rails applications.

## dust.js

`dust_assets` right now comes with a packaged `v0.3.0` of `dust.js`. Some work
is being currently done in extracting dust.js source into a separate gem that 
could be used by other gems as well.

## Installation

Load `dust_assets` in your `Gemfile` as part of the `assets` group

    group :assets do
      gem 'handlebars_assets'
    end

Then run 'bundle install'

Require `dust.js` in your Javascript manifest (i.e. `application.js`)

    //= require dust

## Precompiling

`dust_assets` also works when you are precompiling your assets. If you are deploying to Heroku, 
be sure to read the [Rails guide](http://guides.rubyonrails.org/asset_pipeline.html#precompiling-assets) 
and in your `config/application.rb` set:

    config.assets.initialize_on_precompile = false

Your file extensions tell the asset pipeline how to process the file. Use 
`.dust` to compile the template with Dust. Combine it with `.jst` to add 
the compiled template to the `JST` global variable.

## JST

`sprockets` ships with a simple JavaScript template wrapper called `JST` for
use with the `ejs` and other gems.

`dust_assets` is compatible with `JST`. If you name your template files `name.jst.dust`,
 you will have access to your templates through the `JST` global 
 just like your `ejs` templates.
 
### A note about dust.js templates and the current implementation of `dust_assets` gem:
 
dust.js templates are *asychronous* so when using the compiled templates availables trough
the `JST` object you must supply a callback along with the context in which the template will
be evaluated, suppose you have a template in 'app/assets/javascripts/templates/hello.jst.dust' that
looks like this:

```
  Hello {name}!
```

In your code do something like this (this example is taken from a real Spine.js application written in 
CoffeScript) 

```
  JST['templates/hello.jst.dust'] name: "Aleksander", (out, err) ->
    @html out
```

In JavaScript should be something like this:

```
  JST['templates/hello.jst.dust']({ name: "Aleksander" }, function(out, err) {
    return this.html(out);
  });
```

# Example Rails 3 application using ´dust_assets´:

You can go to [`dust_assests_example`](https://github.com/hasmanydevelopers/dust_assests_example) and  
see some basic usage of `dust_assets`.

# Thanks

Thank you Aleksander Williams (@akdubya) for [dust.js](https://github.com/akdubya/dustjs).

Thank you Les Hill (@leshill) [handlebars_assets](https://github.com/leshill/handlebars_assets)

Thank you Charles Lowell (@cowboyd) for [therubyracer](https://github.com/cowboyd/therubyracer) and [handlebars.rb](https://github.com/cowboyd/handlebars.rb).

# Contributing

Once you've made your great commits

1. Fork
1. Create a topic branch - git checkout -b my_branch
1. Push to your branch - git push origin my_branch
1. Create a Pull Request from your branch
1. That's it!

# Authors

* Anderson Sequera (@andersonsp)
* Jose Narvaez (@goyox86)
* Manuel Mujica (@evilsaurer)

# Contributors

* Your name here!
