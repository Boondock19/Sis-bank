# Sis-bank
## Ruby on rails project

Projecto con el objetivo de crear un CRUD para la creacion de usuarios, sin autenticacion de los mismos, unicamente para registro y control de una cartera de clientes. 
Se realizo con ruby y el framework Rails, es decir, ruby on rails. Adicionalmente la basa de de datos utulizada es postgresql, para los estilos se utilizo bootstrap con una configuracion a traves de los CDNs. 

Sobre el versionamiento ruby y el framework rails, se utilizo la version 3.2.1 de ruby y la version 7.0.8 de rails.

### Nota importantes para poder correr el proyecto:
1. Se debe tener instalado ruby y rails en la version mencionada anteriormente.
2. Se debe tener instalado postgresql.
3. Correr el comando bundle install para instalar las gemas necesarias para el proyecto.
4. Modificar el archivo **database.yml** con los datos de un usuario de postgresql con permisos
suficientes para manipular y crear bases de datos, en las seccion de development (cambiar valores de username y password).
5. Correr el comando **rake db:create** para crear la base de datos.
6. Correr el comando **rake db:migrate** para crear las tablas necesarias para el proyecto.
7. Correr el comando **bin/rails db:seed** para llenar la tabla de personType con valores por defecto.
8. Correr el comando **bin/rails server**  para correr el servidor de rails.
