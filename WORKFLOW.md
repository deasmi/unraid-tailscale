Tags
----

Docker Hub Tags: dev, [0-9].[0-9]
Git Tags: [0-9].[0-9]

Process for upgrade
-------------------

Edit dockerfile
Build and push dev tag
Note to use --no-cache to ensure clear pull of code and build

~~~
docker build --no-cache -t deasmi/unraid-tailscale:dev-[0-9.]+ .
docker push deasmi/unraid-tailscale:dev-[0-9.]+
~~~

Test and repeat on unraid with dev tag until happy

Commit changes and create new git tag
~~~
git commit -m "..." Dockerfile
git tag [0-9].[0-9]
git push --tags`
~~~

Check DockerHub build status

Tags used to include a v - this has been deprecated, tags to match exactly upstream code tags
