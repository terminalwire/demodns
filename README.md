# README

This is a demo Rails app that shows how developers can integrate a command-line interfaces into existing Rails applications via [Terminalwire](https://terminalwire.com/).

## Videos

The code from this project was used in demos recorded on YouTube.

[![Bolt a command-line app into an existing Rails app](https://immutable.terminalwire.com/7MvsdCY3sBifSAoPQJNnWU8Ko7UrPGGkR8DdZSf0uGJP5Sr6Mgnvr9OVI8yPoJvCSqFhh5oDHhD3S4xj9u40MnhSTAodGX1AEro1.png)](https://www.youtube.com/watch?v=3q0wpXdGODc)

## Getting Started

This is a plain 'ol Rails app, so Rails developers should feel just at home getting this spun up. To get started run these commands:

```sh
# Clone the git repo
$ git clone https://github.com/terminalwire/demodns
# Switch into the directory
$ cd demodns
# Install dependencies
$ bundle
# Run the server
$ bin/rails server
```

Once the server is running, you can open in in your browser at https://localhost:3000.

### Run the development environment command-line

The development Terminalwire thin-client is at [./bin/demodns](./bin/demodns), which you can run against your local development environment:

```sh
# Run the local demodns binary
$ ./bin/demodns
```

## "Production" deployment

[This demo is deployed to "production"](https://demodns.fly.dev), 1GB Fly.io instance running SQLite, at https://demodns.fly.dev.

### Try the Terminalwire "production" client

You may install DemoDNS on your system with the Terminalwire one-liner curl installer:

```sh
$ curl -LSs https://demodns.terminalwire.sh | bash
```

This installs the Terminalwire thin client to `/opt/terminalwire`, configures the `$PATH` to pick-up `terminalwire-exec`, and installs the `demodns` executable to your machine.

## Terminal application files

The Terminalwire files for this project are located in the [./app/terminal](./app/terminal) directory.

Documentation for these files may be found at the following:

* **[Terminalwire Rails Manual](https://terminalwire.com/docs/rails)** - Documentation for building Terminalwire apps on a Rails application server.
* **[Thor Website](http://whatisthor.com/)** - Documentation for the Terminalwire command-line parser, which is the same one used by Rails, RubyGems, and many other command-line projects.
* **[Terminalwire Client Manual](https://terminalwire.com/docs/client)** - Documentation for the Terminalwire thin-client, including client-side security features.
