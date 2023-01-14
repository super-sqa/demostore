# WordPress and MariaDB (MySQL) starter image
* E-Commerces site with WordPress and WooCommerce to practice automated testing on.
* Runs both WordPress and a database in the same container
* Meant to be used to run an e-commerce site and practice automated testing on
* WARNING: only meant to be run on local machine. Security is not considered when creating this project. DO NOT USE IN PUBLIC OR PRODUCTION ENVIRONMENT. 
* The more proper way to run WordPress is using docker-compose and separate containers for database and WordPress. But since this is just for testing, to make it convinient the site is created using one container for both WordPress & Database.

## There are several options to run e-commerce site locally
### Option 1: Run a container that is ready to go ( no configuration needed)
### Option 2: Run base container with only WordPress and database. Then restore ecomm site from provided backup.
### Option 3: Run base container with only WordPress and database. Then configure everything manually.
    * Pull and run image: 
    * Info: 
    * It has all configurations, database, sample data, ...
    * No setup needed

##  Option 1: Run a container that is ready to go
An image with all the configurations is available. All you have to do is pull the image and start a container.
This image was created from this repo as base wordpress, configurations applied and new image commited.
To start using it for API testing, all you need to do is login to the WordPress admin and create access credentials.
To run a ready to go site run this command.<br>
** <b>Volumes are not used so if you delte the container all data you create will be deleted.<b>

Docker Hub: https://hub.docker.com/r/supersqa/demostore_complete
<br> Image: <b> supersqa/demostore_complete:latest </b>
```
docker run -p 8080:80 -p 3308:3306 -d --name demostore supersqa/demostore_complete:latest
```

 Verify container is running
```
docker ps
```
You should see an output like this

```
CONTAINER ID   IMAGE                             COMMAND                  CREATED          STATUS                      PORTS                                          NAMES
02a23bc60233   supersqa/demostore_complete:latest   "docker-entrypoint.s…"   5 seconds ago    Up 4 seconds                0.0.0.0:8080->80/tcp, 0.0.0.0:3309->3306/tcp   demostore_copy_1
```

The example is using port 8080 to access the site and port 3308 to access the database.

Go to <b> http://0.0.0.0:8080/ </b> and verify page loads.


WordPress admin user
   * Username: admin
   * Password: password

Database user for WordPress
   * Username: user1
   * Password: password

Database root user:
   * Username: root
   * Password: password


##  Option 2: Run base container with only WordPress and database then restore site from a backup
For this option you will just run clean install of WordPress, install a plugin and restore the site from a backup.
The backup is provided in ```/backups/localstore_wordpress_backup_wpvivid.zip```

* You can build an image from this repo 
```
docker buid -t <your image name> .
```
or pull the prebuilt image
```
docker pull supersqa/wordpress-with-db:latest
```

Then run a container
```
docker run -d -p 8080:81 -p 3308:3306 supersqa/wordpress-with-db:latest
```
If you build your own image replace 'supersqa/wordpress-with-db:latest' by your image name.

Go to <b> http://0.0.0.0:8080/ </b> and verify page loads.

* Go through the initial setup process.
* Login to the backend http://0.0.0.0:8080/wp-admin
* Install plugin called (WPVivid Backup Plugin ) https://wordpress.org/plugins/wpvivid-backuprestore/
* Activate the plugin 
* Backup form the given backup file ```/backups/localstore_wordpress_backup_wpvivid.zip```

Database user for WordPress
* Username: user1
* Password: password

Database root user:
* Username: root
* Password: password


## Option 3: Run base container with only WordPress and database, then configure everything manually.

* Follow first steps from Option 2 to run clean WordPress container
* Go through the initial setup process
* Login to the backend http://0.0.0.0:8080/wp-admin
* Install theme (Store Front recommended)
* Install plugin WooCommerce
* Upload sample data for WooCommerce
* Configure WooCommerce and appearance
