# README

Data entry project donated to Redfia using Ruby on Rails 5.

Requirements:

* MySQL v5.7
* Ruby 2.5
* Nginx 1.15

## Docker
You can use the included docker-compose file for both development and production.

Every change perform on the current code at the host will be reflected on the rails container created by this docker-compose.

### Initial Configuration

Create a custom docker volume to store the database data so it can persist even
after the containers are destroyed. We will refer to this volume as
**"db_volume"** from now on this readme file for easier reading.

Create an **".env"** file using **".env.dist"** file as template to configure
the docker project to fit your needs. Look at the template file for more details
about each configuration parameter.

Create all your application secrets (database credentials, domain name, etc.) by
using the **"/docker/secrets/samples"** directory and files as a sample, just
copy and paste it's contents inside **"/docker/secrets"** directory, then modify
each secret and certificate to match your needs and security level.

If you don't have an existing database, then remember to add your database seed
inside **"/docker/infraestructure/db/seeds"** directory so it is restored when
the database container is created for first time (db_volume should be empty to
be restored). Additionally, you will need to add a "USE" statement as your
database seed first line to make sure it restore the seed on the right database.

Remember to add the domain name to your **"/etc/hosts"** file when deploying on
development environment so you can access the site easily.

**TODO:** Create a "waitish" functionality on the app boot script to prevent it
from starting until the database is ready.

Now the initial configuration should be ready, so you can start the docker
compose project by using the included automated **"/deploy.sh"** script or by
doing manually using docker-compose command.

### Using the automated deploy script (recommended)

This project provides a basic automated deployment script **"deploy.sh"** that
can be use to easily manage this docker compose project. To do so, just execute
it on the terminal (assuming you are located on the project's root directory):

* To rebuild the project's containers:

  ./deploy.sh rebuild

* To start/restart the project's containers:

  ./deploy.sh start

* To destory the project's containers:

  ./deploy.sh destroy

That's it! it will do the rest for you, including attaching the started
containers logs to the current terminal so you can monitor all it's
containers activities. To stop the containers, just hit **"ctrl + c"** and it will
gracefully stop the containers for you.

For more information and commands, execute the deployment script with *"--help"*
option:

  ./deploy.sh --help

### Deploying manullay with docker-compose

Remember to check the "Initial Configuration" section before you execute the
docker project and to execute a **"down"** command before switching between **dev** and **prod** environments within the same project directory.

**"PWD"** parameter is required to execute docker-compose commands since it is used to specify host relative paths. The automated deployment script already does this
internally, but you will have to explicitly do it since you are deploying the
project manually. Another option is to add **"PWD"** param inside **"/.env"**
file with an absolute path of the project so you don't need to add it everytime
you want to execute a docker compose command.

#### Build the containers

To build the contianers without startint it, use the following command:

    env PWD="$PWD" docker-compose up --no-start

Once the containers are initialized, we can use "start" command.

#### Start the existing containers
To build the contianers without startint it, use the following command:

    env PWD="$PWD" docker-compose start && env PWD="$PWD" docker-compose logs -f

#### Stop the existing containers
To build the contianers without startint it, use the following command:

    env PWD="$PWD" docker-compose stop

#### Destroy the existing containers
To build the contianers without startint it, use the following command:

    env PWD="$PWD" docker-compose down
