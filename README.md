# README

User Story

As a consumer of adult beverages,
I want a better understanding of what I’m drinking,
By knowing what a proper alcohol serving is.

As a value driven consumer of adult beverages,
I want a better understanding of what each serving costs,
And a better understanding of how that serving compares to other options

How to set up this app

1.  $ gem install rails
2.  $ rails new elixir-ed --database=postgresql --skip-turbolinks --skip-test-unit
3.  $ cd elixir-ed
4.  $ bundle exec rake db:create
5.  $ gem install pry-rails
6.  Edit Gemfile by adding

      gem 'pry-rails', group: [:development, :test]

7.  $ bundle exec rails server --binding=0.0.0.0
