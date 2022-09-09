# Woofie App 🐾

Ruby on Rails social media project specifically for dog lovers 🐕

## Introduction

Most popular social media caters a wide variety of people with different interests, making it a jack of all trades. That's why we created a social media that targets a specific market (and of course, dog lovers!). So going in to this app, you don’t have to guess anymore, because you know that they have the same interest as you. ☺

## Description

Our app is as much as what you expected from a social media. You can create an account, chat with people, add new friends and share your thoughts through posting and commenting.... so why use this app?

***DOGS***

If that's not a reason enough, here's more:

- [x] customize your dashboard based on your preferred dogs.
- [x] join a dog community to see posts and comments specifically for that dog breed.
- [x] see what other users prefer or checkout out all of the people joined in a specific community.
- [x] toxic free contents! who loves dogs and are toxic anyway? 😄
- [ ] no dancing guys/gals here.....
- [x] .....but expect to see dancing dogs!

## Requirements

* ruby 3.1.2
* rails 7.0.3.1
* redis
* postgresql

#### API used:
- The Dog API (for the sample of dog lists)
- randomuser (for the avatar randomizer of dummy accounts)

most gems are plug-n-play, just run `bundle install` and you're good to go!

## Startup

- Run `rails db:create db:migrate db:seed` to create the database
- Go to the page and create an account.
- Upon registering, it will email you the confirmation link to proceed in logging in.

... and that's it!

#### Running the `rails db:seed` earlier will generate the following:
- Sample dog lists as basis for the dog community.
- Channels (group chat) for the created dog community.
- Dummy accounts. You may use "dummy01@email.com" as username (up to "dummy10@email.com") with all having the same password as "123456"

