## Part 1. Готовый докер

* Взять официальный докер образ с nginx и выкачать его при помощи docker pull

![](./screenshots/1.1.png "Download nginx using docker pull")

* Проверить наличие докер образа через docker images

![](./screenshots/1.2.png "Checking for the docker image")

* Запустить докер образ через docker run -d [image_id|repository]

![](./screenshots/1.3.png "Run docker image")

* Проверить, что образ запустился через docker ps

![](./screenshots/1.4.png "Checking that the image is running")

* Посмотреть информацию о контейнере через docker inspect [container_id|container_name]

![](./screenshots/1.5.png "View container information")

* По выводу команды определить и поместить в отчёт размер контейнера, список замапленных портов и ip контейнера

![](./screenshots/1.6.png "Container size")

![](./screenshots/1.6-1.png "Mapped ports")

![](./screenshots/1.6-2.png "Container ip")

* Остановить докер образ через docker stop [container_id|container_name]

![](./screenshots/1.7.png "Stop docker image")

* Проверить, что образ остановился через docker ps

![](./screenshots/1.8.png "Checking that docker image has stopped")

* Запустить докер с замапленными портами 80 и 443 на локальную машину через команду run

![](./screenshots/1.9.png "Run docker with mapped ports")

* Проверить, что в браузере по адресу localhost:80 доступна стартовая страница nginx

![](./screenshots/1.10.png "Checking nginx start page is available in the browser at localhost:80")

* Перезапустить докер контейнер через docker restart [container_id|container_name]

![](./screenshots/1.11.png "Restart docker")

* Проверить любым способом, что контейнер запустился

![](./screenshots/1.12.png "Checking that the container is running via browser")

![](./screenshots/1.13.png "Checking that the container is running via curl")

## Part 2. Операции с контейнером

* Прочитать конфигурационный файл nginx.conf внутри докер контейнера через команду exec

![](./screenshots/2.1.png "Read the nginx.conf file inside the docker")

* Создать на локальной машине файл nginx.conf

* Настроить в нем по пути /status отдачу страницы статуса сервера nginx

![](./screenshots/2.2.png " Create a nginx.conf file and configure it on the /status path to return the nginx server status page")

* Скопировать созданный файл nginx.conf внутрь докер образа через команду docker cp

![](./screenshots/2.3.png "Copy the created nginx.conf file inside the docker")

* Перезапустить nginx внутри докер образа через команду exec

* Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx

![](./screenshots/2.4.png "Restart nginx inside the docker image and check that localhost:80/status returns the nginx server status page")

* Экспортировать контейнер в файл container.tar через команду export

* Остановить контейнер

![](./screenshots/2.5.png "Export the container to a container.tar and stop running container")

* Удалить образ через docker rmi [image_id|repository], не удаляя перед этим контейнеры

![](./screenshots/2.6.png "Delete the docker image without removing the container first")

* Удалить остановленный контейнер

![](./screenshots/2.7.png "Delete the stopped container")

* Импортировать контейнер обратно через команду import

* Запустить импортированный контейнер

* Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx

![](./screenshots/2.8.png "Import the container back, run the imported container and check that localhost:80/status returns the nginx server status page")

## Part 3. Мини веб-сервер

* Написать мини сервер на C и FastCgi, который будет возвращать простейшую страничку с надписью Hello World!

![](./screenshots/3.1.png "Write a mini server in C and FastCgi that will return a simple page saying Hello World!")

* Запустить написанный мини сервер через spawn-fcgi на порту 8080

![](./screenshots/3.9.png "Run the written mini server via spawn-fcgi on port 8080")

* Написать свой nginx.conf, который будет проксировать все запросы с 81 порта на 127.0.0.1:8080

![](./screenshots/3.2.png "Write your own nginx.conf that will proxy all requests from port 81 to 127.0.0.1:8080")

* Проверить, что в браузере по localhost:81 отдается написанная вами страничка

![](./screenshots/3.10.png "Check that browser on localhost:81 returns the page you wrote")

* Положить файл nginx.conf по пути ./nginx/nginx.conf (это понадобится позже)

## Part 4. Свой докер

* Написать свой докер образ, который:

* 1) собирает исходники мини сервера на FastCgi из Части 3                                    

* 2) запускает его на 8080 порту                             

* 3) копирует внутрь образа написанный ./nginx/nginx.conf            

* 4) запускает nginx.

![](./screenshots/4.1.png "Write your own docker image")

![](./screenshots/4.2.png "Builds mini server, runs it on port 8080")

* Собрать написанный докер образ через docker build при этом указав имя и тег                                  

![](./screenshots/4.6.png "Build the written docker image with docker build, specifying the name and tag")

![](./screenshots/4.7.png "Build the written docker image with docker build, specifying the name and tag")

* Проверить через docker images, что все собралось корректно

![](./screenshots/4.8.png "Check with docker images that everything is built correctly")

* Запустить собранный докер образ с маппингом 81 порта на 80 на локальной машине и маппингом папки ./nginx внутрь контейнера по адресу, где лежат конфигурационные файлы nginx'а (см. Часть 2)

* Проверить, что по localhost:80 доступна страничка написанного мини сервера

![](./screenshots/4.9.png "Run the built docker image by mapping port 81 to 80 and check that the page of the written mini server is available on localhost:80")

* Дописать в ./nginx/nginx.conf проксирование странички /status, по которой надо отдавать статус сервера nginx

![](./screenshots/44.png "Add proxying of /status page in ./nginx/nginx.conf to return the nginx Яserver status")

* Перезапустить докер образ

## Part 5. **Dockle**

* Просканировать образ из предыдущего задания через dockle [image_id|repository]

![](./screenshots/5.1.png "Check the image from the previous task with dockle [image_id|repository]")

* Исправить образ так, чтобы при проверке через dockle не было ошибок и предупреждений

![](./screenshots/5.2.png "Fix the image so that there are no errors or warnings when checking with dockle")

![](./screenshots/5.3.png "Fix the image so that there are no errors or warnings when checking with dockle")

## Part 6. Базовый **Docker Compose**

* Написать файл docker-compose.yml, с помощью которого:

* 1) Поднять докер контейнер из Части 5 (он должен работать в локальной сети, т.е. не нужно использовать инструкцию EXPOSE и мапить порты на локальную машину)

* 2) Поднять докер контейнер с nginx, который будет проксировать все запросы с 8080 порта на 81 порт первого контейнера

* Замапить 8080 порт второго контейнера на 80 порт локальной машины

![](./screenshots/6.1.png "Write a docker-compose.yml file")


* Остановить все запущенные контейнеры

* Собрать и запустить проект с помощью команд docker-compose build и docker-compose up

* Проверить, что в браузере по localhost:80 отдается написанная вами страничка, как и ранее

![](./screenshots/6.2.png "Build and run the project with the docker-compose build and docker-compose up commands")
