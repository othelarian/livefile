require! {
  livescript: ls
  'fs-extra': fse
  #'prelude-ls': prl
}

a =
  fse.readFileSync \lib/live.ls \utf-8
  |> (flip ls.compile) { bare: on, header: off }
  |> ('#!/usr/bin/env node\n\n' +)

fse.writeFileSync 'bin/live.js', a
