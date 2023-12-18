require! {
  fs
  livescript: ls
  optionator
}

options = [{ option: \help, alias: \h, type: \Boolean }]
option = (name, short, tp, params, desc) ->
  #
  # TODO
  #
  console.log 'add an option (not ready)'
  #

tasks = {}
task = (name, desc, fn) -> tasks[name] = { desc, fn }

global.option = option
global.task = task

try
  ls.run fs.readFileSync \Livefile \utf-8
  #args = process.argv.slice 2
  #
  op = optionator { prepend: 'Usage: live [options]', options }
  #
  #
  #opts = optionator.parseArgv args
  #
  opts = op.parseArgv process.argv
  #
  if opts.help
    console.log op.generateHelp!
  else
    #
    console.log 'run'
    #
    console.log process.argv
    #
    #console.log "######## args: #{args}"
    #
    console.log opts
    #
catch e
  switch e.code
  | \ENOENT   => console.log 'There is no Livefile at this package root'
  | otherwise => console.log e


/* register

# Load and run a CoffeeScript file for Node, stripping any `BOM`s.
loadFile = (module, filename) ->
  options = module.options or getRootModule(module).options or {}

  # Currently `CoffeeScript.compile` caches all source maps if present. They
  # are available in `getSourceMap` retrieved by `filename`.
  if cacheSourceMaps or nodeSourceMapsSupportEnabled
    options.inlineMap = true
  js = CoffeeScript._compileFile filename, options

  module._compile js, filename

# If the installed version of Node supports `require.extensions`, register
# CoffeeScript as an extension.
if require.extensions
  for ext in CoffeeScript.FILE_EXTENSIONS
    require.extensions[ext] = loadFile
*/