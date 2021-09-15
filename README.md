# README

## Description
Import data from Poke API to DB. Then serve it by JSON REST API

## Installation
```shell
bundle install
```

```shell
rake db:craete
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
