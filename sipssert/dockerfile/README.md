## Docker Image for SIPssert

This image can be used to run the SIPssert tool for a test set provided by the user.
Build the image with the following command:

```bash
docker build -t opensips/sipssert .
```

Go to your test directory and run the following command:

```bash
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):$(pwd) -w $(pwd) opensips/sipssert .
```
