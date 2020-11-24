RAILS_ENV=development
RAILS_SERVE_STATIC_FILES=false
service_restart:
		git pull; \
		docker-compose down; \
		docker-compose build; \
		docker-compose run app rails assets:precompile RAILS_ENV=${RAILS_ENV}; \
		docker-compose run app rails db:create db:migrate RAILS_ENV=${RAILS_ENV}; \
		docker-compose up -d; \
