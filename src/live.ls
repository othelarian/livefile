require! {
  fs, livescript: ls, optionator
  'prelude-ls': { List, Obj }
}

options = [{ option: \help, alias: \h, type: \Boolean, description: '' }] 
option = (option, alias, type, description) ->
  options.push { option, alias, type, description }

tasks = {}
task = (name, desc, fn) -> tasks[name] = { desc, fn }

global.option = option
global.task = task

try
  fs.readFileSync \Livefile \utf-8 |> ls.run
  prepend = 'Usage: live [options]\n\nOptions:'
  mlgth = Obj.keys tasks |> List.maximum-by (.length) |> (.length)
  filler = (str) -> ' ' * (mlgth - str.length)
  line = (acc, elt) -> "#{acc}#{elt[0]}#{filler elt[0]}  #{elt[1].desc}\n"
  append = Obj.obj-to-pairs tasks |> List.fold line, 'Commands:\n\n'
  op = optionator { append, options, prepend }
  # the if/else below is for testing the lib itself
  args =
    if (new RegExp \lsc .test process.argv[1]) then process.argv.splice 1 1
    else process.argv
  opts = op.parseArgv args
  opts = optionator { append, options, prepend } |> (.parseArgv process.argv)
  switch
    | opts.help          => console.log op.generateHelp!
    | opts._.length is 0 => console.log 'ERROR: no task to run!'
    | opts._.length > 1  => console.log 'ERROR: too many tasks selected!'
    | opts._[0] not in Obj.keys tasks
      console.log "ERROR: task does not exist (#{opts._[0]})!"
    | _                  => tasks[opts._[0]].fn opts
catch e
  switch e.code
  | \ENOENT   => console.log 'There is no Livefile at this package root'
  | otherwise => console.log e