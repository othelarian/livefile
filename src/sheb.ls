require! {
  fs
  livescript: ls
  'prelude-ls': pls
}

a =
  fs.readFileSync \src/live.ls \utf-8
  |> (pls.flip ls.compile) { bare: on, header: off }
  |> ('#!/usr/bin/env node\n\n' +)

fs.writeFileSync 'bin/live.js', a
