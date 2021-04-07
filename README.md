# Laravel base
A Docker Compose work flow that sets up LEPP stack with Traefik integration for Laravel devlopment.

This laravel setup depends on [TheNerdyHamster/compose-local-services](https://github.com/TheNerdyHamster/compse-local-services).
Which setups [Traefik](https;//traefik.io) and [PostgreSQL](https://postgresql.org).

## Requierments
- [Docker](https://docker.com)

## Usage
1. Download and follow instructions on [TheNerdyHamster/compose-local-services](https://github.com/TheNerdyHamster/compse-local-services).
2. Configure the labels in `docker-compose` to your liking.
3. Configure `.env` to you liking.
4. Run `$ docker-compsoe up -d` to start project.

### URLs and ports
- **website** - `template.localhost`
- **mailhog** - `mail.template.localhost`
- **redis** - `:6379`

## PostgreSQL container within project

By default this configuration depends on `compose-local-services`, which includes PostgreSQL.
If prefer to have one datbase container per project, you can add:
```
volumes:
  pgsql:

services:
  pgsql:
    image: postgres:13
    container_name: pgsql
    restart: unless-stopped
    tty: true
    environment:
      POSTGRES_USER: ${PG_USER}
      POSTGRES_PASSWORD: ${PG_PWD}
    ports:
      - 5432:5432
    volumes:
      - pgsql:/var/lib/postgresql/data
    networks:
      - laravel
```

## MailHog

Mailhog is the default tool for testing email and SMTP  during local development for Laravel 8.
The Mailhog service is included in the `docker-compose.yml`, but might be moved to `local-services` in the future.

To see the dashboard and view any emails coming through the system, visit [mail.template.localhost](http://mail.template.localhost) after running `docker-compose up -d`.

## Credits
- [@Aschemlyun](https://github.com/aschmelyun) - Insperation from his [Laravel - Docker compose setup](https://github.com/aschmelyun/docker-compose-laravel)
