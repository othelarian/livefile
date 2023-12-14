# TODO: #!/usr/bin/env node

# TODO: include some modules (chokidar, bach, etc)

require! {
  bach
  chokidar
  'fs-extra': fse
  livescript: ls
}

options = {}
option = (name, short, long, desc) ->
  #
  # TODO
  #
  console.log 'add an option (not ready)'
  #

tasks = {}
task = (name, desc, fn) ->
  tasks[name] = { desc, fn }

console.log process.argv

ls.run fse.readFileSync \Livefile \utf-8

console.log tasks

args = process.argv.slice 2

console.log "######## args: #{args}"


