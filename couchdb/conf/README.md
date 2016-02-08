### Generate self-signed certificate

```bash
$ openssl genrsa -des3 -passout pass:x -out server.pass.key 2048
$ openssl rsa -passin pass:x -in server.pass.key -out server.key
writing RSA key
$ rm server.pass.key
$ openssl req -new -key server.key -out server.csr
...
Country Name (2 letter code) [AU]:
State or Province Name (full name) [Some-State]:
...
A challenge password []:
...
$ openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
Signature ok
subject=/C=AU/ST=Some-State/O=Internet Widgits Pty Ltd/CN=localhost
Getting Private key
```

### Generate strong Diffie-Helman parameters

```bash
$ openssl dhparam -out dhparams.pem 2048
```

**NOTE**: For higher key size negotiation, you may wish to create a 4096 bit dhparams file.  Just change the number above.

### Concatenate to chain.pem

The `chain.pem` file contains your SSL key, certificates and DH parameters.

Specifically, the following information:
* The server's private key
* The server's certificate (signing its private key)
* (Optionally) Intermediate certificates
* (Optionally, recommended) DH parameters

To create the PEM file, use something similar to the following:

```sh
$ cat server.key server.crt [intermediate_cert1.pem ...] dhparams.pem > chain.pem
```
