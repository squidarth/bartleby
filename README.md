## Bartleby

### Motivation

Bartleby simplifies the debugging process.  Rather than waiting for a an
exception to occur and then throwing a debugger or print statement in your
code, Bartleby allows you to see a list of variables and their values through
the execution of a program.  In the case of null-pointer exceptions, for example,
this helps make it clear exactly when a variable took on a null value.

### Installation

In order to use Bartleby, you need to have Redis installed and running.  View
http://redis.io/ for more information about how to install it.

Since it is written in Node.js, Node.js and NPM must both be installed.
These can be downloaded at http://nodejs.org/download/.

Bartleby can then be installed with the command
`npm install bartleby -g`

To check that the Bartleby installation was successful, try running: `bartleby` 
to start the Bartleby server. Navigate to `localhost:3700` to view the site.

### Client Libraries

You also need to install a client library for your language in order to use this.
Right now, there is only a Python library, http://github.com/squidarth/bartleby-py.

A Ruby version will be out soon, if you're eager, take a look at [Bartleby-Rails](http://github.com/squidarth/bartleby-rails)
for an example Rails app integrated with Bartleby.

### Demo

Watch my [demo](http://www.youtube.com/watch?v=tLsH3CMCOpo&feature=youtu.be)
