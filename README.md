# README

## Description
Import data from Poke API to DB. Then serve it by JSON REST API

## Installation
```shell
bundle install
```

```shell
rake db:create
rake db:migrate
```

## Start project
```shell
bundle exec rails s -p <port>
```

## Retrieve up to date pokemon list
```shell
rake pokemon:import_data
```

## How to use the API
```shell
curl <hostname>/pokemons
```
```shell
curl <hostname>/pokemons/:id
```

## Heroku APP

https://alex-pokemon-api.herokuapp.com/pokemons
https://alex-pokemon-api.herokuapp.com/pokemons/1
