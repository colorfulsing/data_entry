# README

Data entry project donated to Redfia using Ruby on Rails 5.

Requirements:

* MySQL v5.7
* Ruby 2.4.2
* Nginx 1.13.12

##Docker
You can use the included docker-compose file for both development and production.

Every change perform on the current code at the host will be reflected on the rails container created by this docker-compose.

Remember to execute a **"down"** command before switching between **dev**, **test**, and **prod** environments within the same project directory.

"PWD" parameter is required to execute docker-compose commands since it is used to specify host relative paths.

### "up" command requirements
Before you can execute the "up" command, you need to create the following files:

*./docker/secrets/db_user.txt*

* Contains the database user to be used on the containers.

*./docker/secrets/db_pass.txt*

* Contains the database password to be used on the containers.

*./docker/secrets/app_secret_key.txt*

* Contains the website secret used to manage the user session.

*./docker/db/seed/seed.sql.gz*

* (Optional) Initialize the database using a custom seed backup script. It can be compressed as ".sql.gz" or uncompressed as ".sql" extensions.

You will also need to create or reuse a database storage volume called **"db_volume"** to store the appliation persistent data. This volume will persists even after a "down" command and **it's highly recommended that this volume is located into a safe location since it will store the database.** You can use the following command to create a new one for dev or prod environments within the default docker directory structure:

    docker volume create db_volume

### "up" command execution

To execute as development, use the following command:

    env PWD="$PWD" ENV="dev" docker-composer up

To execute as development and perform the automated tests, use the following command:

    env PWD="$PWD" ENV="dev" EXEC_TEST=1 docker-composer up

To execute as production, use the following command:

    env PWD="$PWD" docker-composer up

Once the containers are initialized, we can use "start" and "stop" commands.

### Nginx container configuration

The default nginx configuration is set to use "http://data-entry.redfia.com" as server name and port 8080 as gateway. You need to add this host as local on your /etc/hosts file to be able to access the website. You can find both dev and prod nginx configuration templates here:

*./docker/web/site_config_dev.conf.template*
*./docker/web/site_config_prod.conf.template*

Make sure to adjust these settings along the docker-compose file before deploying to production to make sure it fits your production environment arquitecture.