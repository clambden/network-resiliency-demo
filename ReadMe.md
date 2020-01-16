# Setup

1. Create a new docker network

> `docker network create my-net`

2. Launch the petstore api

> `docker run --rm -d -e OPENAPI_BASE_PATH=/v3 -p 80:8080 --network my-net --name petstore openapitools/openapi-petstore`

3. Create a docker image with ip tools ( `curl`, `ping`, `tc` and `netem`) pre-installed. N.B. this must be executed with the Dockerfile in the current directory

> `docker build -t ubuntu_iptools .`

4. Create a container from the ubunto_iptools image

> `docker run --rm -it --privileged --network my-net ubuntu_iptools`

5. Test the connection to the petstore API (from the ubuntu_iptools container)

> `curl petstore:8080`

6. Apply a network delay

> `tc qdisc add dev eth0 root netem delay 1000ms`

7. And re-test

> `curl petstore:8080`

# netem commands

Add a delay of 200ms:

```
tc qdisc add dev eth0 root netem delay 1000ms
```

Edit the delay to 1 second:

```
tc qdisc change dev eth0 root netem delay 1000ms
```

Remove the delay:

```
tc qdisc delete dev eth0 root
```

# References

- http://man7.org/linux/man-pages/man8/tc-netem.8.html
- https://wiki.linuxfoundation.org/networking/netem
- https://engineering.talkdesk.com/resilience-testing-breaking-software-for-added-reliability-7f1e60207d06
- https://github.com/alexei-led/pumba
