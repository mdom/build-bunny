<p><img src="build-bunny.webp"><p>

# build-bunny - A simple build server

## SYNOPSIS

    $ ./build-bunny daemon &
    $ ./build-bunny minion worker --jobs 1 &
    $ curl http://localhost:3000/notify?url=git://example.com/repo.git&rev=master&token=secret

## DESCRIPTION

This is a minimal build server that listens for notifications about new commits
and then builds the corresponding repository. The build script is expected to
be located in the `scripts` directory and is called `build.sh` by default.

After the build has finished, a notification is sent to the configured email
addresses.

## CONFIGURATION

### build-bunny.conf

The server can be configured using a configuration file. The default
location is `./build-bunny.conf`. The following environment variables
can be used to override the default values.

- dbfile

    The path to the SQLite database file. Defaults to `./minion.db`.

- token

    The token that must be included in the notification request. Defaults to `secret`.

- build\_dir

    The directory where the build will be performed. Defaults to `/tmp`.

- build\_config

    The path to the build configuration file. Defaults to `./build.conf`.

- script\_dir

    The directory where the build scripts are located. Defaults to `./scripts`.

### build.conf

The configuration file is a Perl script that returns a hash reference. The keys
are the URLs of the repositories that should be built. The values are hash
references with the following keys:

- script

    The name of the build script. Defaults to `build.sh`.

- notify

    An array reference with the email addresses that should be notified after the
    build has finished.

Example:

    {
      'git://example.com/repo.git' => {
        script => 'build.sh',
        notify => [ 'admin@exmaple.com' ],
      },
    }

## ROUTES

### GET /

Lists the last 10 jobs with their status and the console
output.

### GET /notify

Triggers a new build. The following parameters are required:

- url

    The URL of the repository.

- rev

    The revision to build.

- token

    The token that must be included in the request.

## ENVIRONMENT

The following environment variables can be used to configure the server:

### BUILDBUNNY\_DB

The path to the SQLite database file. Defaults to `./minion.db`.

### BUILDBUNNY\_BUILD\_DIR

The directory where the build will be performed. Defaults to `/tmp`.

### BUILDBUNNY\_BUILD\_CONFIG

The path to the build configuration file. Defaults to `./build.conf`.

### BUILDBUNNY\_SCRIPT\_DIR

The directory where the build scripts are located. Defaults to `./scripts`.

### BUILDBUNNY\_TOKEN

The token that must be included in the notification request.

Mario Domgoergen <mario@domgoergen.com>

## COPYRIGHT AND LICENSE

Copyright (C) 2024 by Mario Domgoergen

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
