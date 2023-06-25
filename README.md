## LEKKI PROPERTY API

This is the Lekki property API. An API application built with ruby on the rails framework. It exposes 3 endpoints for creating, updating and fetching real estate properties. The specifications of these endpoints are documented in the......


* Ruby version - 3.1.4
* Rails version - 7.0.5

# SYSTEM DEPENDENCIES

The only real dependency of this application is docker and docker-compose. This is because the application was built and contanerized with docker and docker-compose.  This implies that running the application will require a computer capable of virtualization with an installation of both docker and docker-compose. visit the docker page "https://www.docker.com/" to download and install these tools if they are not yet installed.   

# CONFIGURATION

Configurations to be carried before running this application includes setting up the database environment variables. This can be done in the .env file. For development, The application comes with an embedded postgres database which runs as a seperate container. The list of environment variables to set includes the following:

1. DB_HOST => This is the database host name. It should be the name of the database container outlined in the docker-compose file (for dev environment). It defaults to "db" (current dev database container name)if not provided.

2. DB_USERNAME => The user name of database to connect with for dev environment. Defaults to the current set username of the docker compose file.

3. DB_PASSWORD => The password of database to connect with for dev environment. Defaults to the current set password on the docker compose file.

4. DB_PORT => The port of database to connect to. Defaults to 5432 for all environments.

5. DB_DEV => Data base name for dev server. Defaults to a preset name if not provided.

6. DB_NAME => Data base name for production server. Defaults to a preset name if not provided.

7. LEKKI_PROPERTY_API_DATABASE_USERNAME => Database username for production server. Must be provided when running production server.

8. LEKKI_PROPERTY_API_DATABASE_PASSWORD => Database password for production server. Must be provided when running production server.


# DATABASE CREATION AND INITIALIZATION

Once these variables has been set. The database can either be created manually or by running ```docker-compose run api rake db:create``` on a terminal at the root directory fo this project. After this is done, run ```docker-compose run api rake db:migrate``` to run data migrations and initialize the database.


# STARTING THE APPLICATION

To start the application simply run ```docker-compose rup``` on a terminal at the root directory fo this project. This will start the application on "http://localhost:3000".
