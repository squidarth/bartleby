#!/usr/bin/env coffee
app = require("../app.coffee")
static_dir = "."

if process.argv.length > 2
  static_dir = process.arg[2]

app.init(static_dir)
