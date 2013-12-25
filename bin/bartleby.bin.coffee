#!/usr/bin/env coffee
app = require("../app.coffee")
optimist = require("optimist")
  .usage("Run the Bartleby server")
  .alias("p", "port")
  .alias("rh", "redis-host")
  .alias("rp", "redis-port")
  .alias("h", "help")
  .default("p", 3700)
  .default("rh", "localhost")
  .default("rp", 6379)
static_dir = "."

if optimist.argv.help
  console.log optimist.help()
  process.exit(code=0)
if process.argv.length > 2
  static_dir = process.argv[2]

app.init(optimist.argv.p, optimist.argv.rh, optimist.argv.rp)
