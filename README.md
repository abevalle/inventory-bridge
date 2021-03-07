# inventory-bridge
This is the middleware for a simple inventroy application


### Docker

1. To create the dev environment run
`$ sudo docker-compose up -d`

2. To access the docker container created run
`$ sudo docker exec -it inventory-bridge zsh`
or if you prefer to use bash
`$ sudo docker exec -it inventory-bridge bash`

Currently to access the code you must clone your code to `~/code` or you can change volume bind in the `docker-compose.yml`