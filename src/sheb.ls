require! {
  livescript: ls
  'fs-extra': fse
  'prelude-ls': { flip }
}

a =
  fse.readFileSync \src/live.ls \utf-8
  |> (flip ls.compile) { bare: on, header: off }
  |> ('#!/usr/bin/env node\n\n' +)

fse.writeFileSync 'bin/live.js', a
