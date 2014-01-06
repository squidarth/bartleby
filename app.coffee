init = (port, redis_host, redis_port) ->
  express = require "express"
  app = express()
  redis = require "redis"
  redis_client = redis.createClient(redis_port, redis_host)

  redis_client.on "error", (error) ->
    #Colors are for the console
    console.log "\x1B[31m\nThere seems to be an error connecting to Redis.  Make sure it is running\n\x1B[0m"
    process.exit 1

  coffee_middleware = require 'coffee-middleware'
  app.use coffee_middleware(
    src: __dirname + "/public"
    compress: true
  )

  app.set "views", __dirname + "/templates"
  app.set "view engine", "jade"
  app.engine "jade", require("jade").__express
  app.use express.static(__dirname + "/public")

  app.get "/", (req, res) ->
    res.render "index.jade"

  io = require("socket.io").listen(app.listen(port))

  io.sockets.on "connection", (socket) ->
    redis_client.on "message", (channel, message) ->
      if channel == "bartleby"
        socket.emit "message", message: message
    socket.on "send", (data) ->
      io.sockets.emit "message", data

  redis_client.subscribe "bartleby"

  console.log "Started Bartleby Server on port #{port}"

exports.init = init
