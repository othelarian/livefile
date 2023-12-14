#!/usr/bin/env node

var bach, chokidar, fse, ls, options, option, tasks, task, args;
bach = require('bach');
chokidar = require('chokidar');
fse = require('fs-extra');
ls = require('livescript');
options = {};
option = function(name, short, long, desc){
  return console.log('add an option (not ready)');
};
tasks = {};
task = function(name, desc, fn){
  return tasks[name] = {
    desc: desc,
    fn: fn
  };
};
console.log(process.argv);
ls.run(fse.readFileSync('Livefile', 'utf-8'));
console.log(tasks);
args = process.argv.slice(2);
console.log("######## args: " + args);