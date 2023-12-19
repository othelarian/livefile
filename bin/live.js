#!/usr/bin/env node

var fs, ls, optionator, ref$, List, Obj, Str, options, option, tasks, task, prepend, mlgth, filler, line, append, op, args, opts, e;
fs = require('fs');
ls = require('livescript');
optionator = require('optionator');
ref$ = require('prelude-ls'), List = ref$.List, Obj = ref$.Obj, Str = ref$.Str;
options = [{
  option: 'help',
  alias: 'h',
  type: 'Boolean',
  description: ''
}];
option = function(option, alias, type, description){
  return options.push({
    option: option,
    alias: alias,
    type: type,
    description: description
  });
};
tasks = {};
task = function(name, desc, fn){
  return tasks[name] = {
    desc: desc,
    fn: fn
  };
};
global.option = option;
global.task = task;
try {
  ls.run(fs.readFileSync('Livefile', 'utf-8'));
  prepend = 'Usage: live [options]\n\nOptions:';
  mlgth = function(it){
    return it.length;
  }(
  List.maximumBy(function(it){
    return it.length;
  })(
  Obj.keys(tasks)));
  filler = function(str){
    return Str.repeat(mlgth - str.length, ' ');
  };
  line = function(acc, elt){
    return acc + "" + elt[0] + filler(elt[0]) + " " + elt[1].desc + "\n";
  };
  append = List.fold(line, 'Commands:\n\n')(
  Obj.objToPairs(tasks));
  op = optionator({
    append: append,
    options: options,
    prepend: prepend
  });
  args = new RegExp('node.exe').test(process.argv[0])
    ? process.argv.slice(1)
    : process.argv;
  opts = op.parseArgv(args);
  switch (false) {
  case !opts.help:
    console.log(op.generateHelp());
    break;
  case opts._.length !== 0:
    console.log('ERROR: no task to run!');
    break;
  case !(opts._.length > 1):
    console.log('ERROR: too many tasks selected!');
    break;
  case in$(opts._[0], Obj.keys(tasks)):
    console.log('ERROR: task does not exist!');
    break;
  default:
    tasks[opts._[0]].fn(opts);
  }
} catch (e$) {
  e = e$;
  switch (e.code) {
  case 'ENOENT':
    console.log('There is no Livefile at this package root');
    break;
  default:
    console.log(e);
  }
}
function in$(x, xs){
  var i = -1, l = xs.length >>> 0;
  while (++i < l) if (x === xs[i]) return true;
  return false;
}