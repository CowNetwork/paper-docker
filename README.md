Paper Docker
============

Dockerized Paper server.

Build will be triggered when tagging this repository. The tag should look like `<minecraft-version>+<tuinity-commit-sha>` e.g `1.16.5+b12d0cce`.
We will always use the last 8 digits of the commit sha from the Paper build.

Since Docker does not support having `+` in the image name, the resulting image can pulled from `ghcr.io/caddle/paper:<minecraft-version>-<build>` e.g `ghcr.io/caddle/paper:1.16.5-b12d0cce`.

Building
--------

Just checkout the repository and run `./build.sh`. You need to provide the environment variables `$GHCR_TOKEN` and `$GHCR_USER` so `docker login` can succeed.


Future things
-------------

* Maybe we want to also push the resulting Maven artifacts to our repository. But currently there are no important changes to the API so we can ignore it for now.
