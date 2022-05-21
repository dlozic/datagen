# Datagen

Simple [Ruby](https://www.ruby-lang.org/en/) + [Faker](https://github.com/faker-ruby/faker) project for generating large datasets. Used for teaching database indexes.

### Checking prerequisites
```shell
ruby -v     # should be >= v3
bundle -v   # should be >= v2
```

### Installing dependencies
Project depends on [Faker](https://github.com/faker-ruby/faker) and [Dotenv](https://github.com/bkeepers/dotenv) packages which are read from Gemfile in the project root. They are installed with Ruby Bundler:
```shell
bundle install
```

### Setting environment variables
File `.env` allows project parametrization. It is created from `.env.example`
and contains information how many records should be generated and where.
```shell
cp .env.example .env
vim .env   # edit the file and change values if needed
```

### Running the generators
Script generates `output.sql` file.
```shell
ruby app.rb
```