# Livefile

## What's this?

I love CoffeeScript's `cake` command, and I love LiveScript, so I decided to create a `live` command, with the same mechanics.

## How to use it?

There's only two functions that really matter:

* `option(name, short, type, description)` => to define an option you can then use into a task
* `task(name, description, function)` => to create a task (ie. a function the `live` command executes)

Honestly, it's as far as similar as `cake` as I wanted it to be.

## Only in LiveScript?

Yes, only LiveScript, with the `prelude-ls` and `optionator` packages, both written in LiveScript. Long live LiveScript ;-)
