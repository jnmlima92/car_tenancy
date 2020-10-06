Aplicação de teste técnico em Ruby on Rails utilizando as tecnologias:

* ruby 2.4.2p198

* postgresql 9.5

* NodeJs 14.13.0

Dependências

* Docker

* Docker Compose

* Portas 3000 e 5432 esatrem liberadas para o server rails e postgresql

Para execução da aplicação no contâiner: 

* Clonar este repositório para local

* sudo docker-compose run --rm web bundle install (Instalar gems)

* sudo docker-compose run --rm web bundle exec rails db:setup (Configurar o banco)

* sudo docker-compose run web bundle exec rspec (Rodar os testes)

* sudo docker-compose up (Subir server)