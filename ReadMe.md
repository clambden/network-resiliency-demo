1. Create a new docker network

> `docker network create my-net`

2. Launch the petstore api

> `docker run --rm -d -e OPENAPI_BASE_PATH=/v3 -p 80:8080 --network my-net --name petstore openapitools/openapi-petstore`

3. Launch ubunto instance with `curl`, `ping`, `tc` and `netem` pre-installed

   - Copy the Dockerfile into a new directory
   - > `docker run --rm -it --privileged --network my-net ubuntu_iptools`

4. Test the connection to the petstore API

> `curl petstore:8080`

6. Apply a network delay

> `tc qdisc add dev eth0 root netem delay 1000ms`

4. And re-test

> `curl petstore:8080`
