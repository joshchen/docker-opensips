This is inspired and forked from https://github.com/OpenSIPS/docker-opensips.

# OpenSIPS Docker Image

http://www.opensips.org/
Docker recipe for building and starting an OpenSIPS image

## Building the image
You can build the docker image by running:
```
make build
```

This command will build a docker image with OpenSIPS master version taken from
the git repository. To build a different git version, you can run:
```
OPENSIPS_VERSION=2.2 make build
```

To build with MySQL support:
```
OPENSIPS_EXTRA_MODULES=opensips-mysql-module make build
```

To start the image, simply run:
```
make start
```

To specify expose port when start the image, run:
```
OPENSIPS_EX_PORT=5060 make start
```

To enter the container shell, simply run:
```
make shell
```

To get the logs from OpenSIPS, simply run:
```
make logs
```

To stop the container, simply run:
```
make stop
```

To resume the container, simply run:
```
make resume
```

To remove the container, simply run:
```
make remove
```

## Variables
You can set different variables to tune your deployment:
 * `OPENSIPS_VERSION` - sets the opensips version (Default: `3.1`)
 * `OPENSIPS_BUILD` - specifies the build to use, `nightly` or `releases` (Default: `releases`)
 * `OPENSIPS_DOCKER_TAG` - indicates the docker tag (Default: `latest`)
 * `OPENSIPS_CLI` - specifies whether to install opensips-cli (`true`) or not (`false`) (Default: `true`)
 * `OPENSIPS_EXTRA_MODULES` - specifies extra opensips modules to install (Default: no other module)
 * `OPENSIPS_EX_PORT` - specifies the expose port using on host (Default: 5060)

