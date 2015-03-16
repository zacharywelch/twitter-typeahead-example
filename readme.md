# Twitter Typeahead Example

This example shows how to use Twitter Typeahead UI w/ the Bloodhound search engine. Users can search for their favorite cartoon character which queries a remote source and returns custom Handlebars templates 

## Installation

Clone the repo

```ruby
git clone git@cagit.careerbuilder.com:zwelch/twitter-typeahead.git
```

Switch to the new directory

```ruby
cd twitter-typeahead
```

Bundle install, rake and seed

```ruby
bundle install
bundle exec rake db:migrate
bundle exec rake db:seed
```

## Technologies used

- [typeahead.js](http://twitter.github.io/typeahead.js/)
- [kabu](http://cb-kabu.herokuapp.com/)
- [kabu-rails](https://cagit.careerbuilder.com/CorpAppsCB/kabu-rails)
- [Handlebars.js](http://handlebarsjs.com/)