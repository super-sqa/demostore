# Run 'deomoste' container
To run "demostore" (a test ecom site) localy execute this docker command

```
docker run -p 8080:80 -p 3308:3306 -d --name demostore admas/demostore_complete:latest
```

## Verify container is running
```
docker ps
```
You should see an output like this

```
CONTAINER ID   IMAGE                             COMMAND                  CREATED          STATUS                      PORTS                                          NAMES
02a23bc60233   admas/demostore_complete:latest   "docker-entrypoint.s…"   5 seconds ago    Up 4 seconds                0.0.0.0:8080->80/tcp, 0.0.0.0:3309->3306/tcp   demostore_copy_1
```

Go to <b> http://0.0.0.0:8080/ </b> and verify page loads.

WordPress admin username and password are
username: admin
password: password
http://0.0.0.0:8080/wp-admin

### To connect to database
* From MySQL Workbench use port 3308 (or whatever port you use) and host 0.0.0.0.
* From command line
 <br>```mysql -h 0.0.0.0 -P 3308 -u root```
<br>or
<br>```mysql -h 0.0.0.0 -P 3308 -u user1 -p mysecret```





sed -i "s/bind-address.*/bind-address = 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
