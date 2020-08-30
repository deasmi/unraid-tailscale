Tags
----

Docker Hub Tags: dev, v[0-9].[0-9]
Git Tags: v[0-9].[0-9]

Process for upgrade
-------------------

Edit dockerfile
Build and push dev tag
Note to use --no-cache to ensure clear pull of code and build

~~~
docker build --no-cache -t deasmi/tailscale:dev-[0-9.]+ .
docker push deasmi/tailscale:dev-[0-9.]+
~~~

Test and repeat on unraid with dev tag until happy

Commit changes and create new git tag
~~~
git commit -m "..." Dockerfile
git tag v[0-9].[0-9]
git push --tags`
~~~

Check DockerHub build status

