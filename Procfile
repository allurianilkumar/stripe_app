web: bin/rails server -p 3000
js: yarn build --watch
css: yarn build:css --watch
worker: bundle exec sidekiq
stripe: stripe listen --forward-to localhost:3000/webhosts/stripe --forward-connect-to localhost:3000/webhosts/stripe
