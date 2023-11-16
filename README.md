# Stripe Example

## To create a controller

rails g controller webhooks

## Update WebhooksController.rb

class WebhooksController < ApplicationController

    skip_before_action :verify_authenticity_token

    def create

    event = Event.create(
        data: params,
        source: params[:source],
    )
    render json: { status: :ok }
    end

end

## Add Routes

post "/webhooks/:source", to: "webhooks#create"

## To create a jobs HandleEvent

rails g job HandleEvent

## update

def perform(event)
end

## Add HandleEventJob.perform_later(event) in controller WebhooksController

## Setup the sidekiq

bundle add sidekiq

## Setup in config/application.rb

config.active_job.queue_adapter = :sidekiq
config.redis = { url: 'redis://localhost:6379/0' }

## add the content in Procfile

web: bin/rails server -p 3000
js: yarn build --watch
css: yarn build:css --watch
worker: bundle exec sidekiq

## Restart the server

rails s

## run the server

foreman start -f Procfile

## Curl

curl -X POST localhost:3000/webhooks -d {"data":"data"}

curl -X POST localhost:3000/webhooks/curl -d {"data":"data"}

## Response

{"status":"ok"}

rails g model Event data:json source:string processing_errors:text status
NOTE:

create_table "events", force: :cascade do |t|
t.json "data"
t.string "source"
t.text "processing_errors"
t.string "status", default: "pending", null: false
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
end

rake db:migrate:schema:load

## Stripe

    bundle add stripe

## stripe login

    stripe login

## stripe listen Terminal-1

    stripe listen

## stripe trigger Terminal-2

stripe trigger customer.created

## Stripe Listen Terminal-1

stripe listen --forward-to localhost:3000/webhosts/stripe

rails c

Event.last

stripe listen --forward-to localhost:3000/webhosts/stripe
--forward-connect-to localhost:3000/webhosts/stripe

## Add a commnad for every time all command in Procfile

stripe: stripe listen --forward-to localhost:3000/webhosts/stripe --forward-connect-to localhost:3000/webhosts/stripe

## Add A Logic EvenHandlerJob

## SETUP

vi config/initializers/stripe.rb

Stripe.api_key = Rails.application.credentials.stripe[:secret]

## Terminal ENV setup

export STRIPE_SECRET_KEY=sk_test_51O6lL2SCGyDO5dg5a6AWjz00VAVhRfEvn8dynptTE4Qz0MZunNug463PLEINXvF1FusPnyqnSsKAT6rsxejAbJ0z001h7jD7zF

Note:

    ps aux | grep redis
    rm -rf /app/tmp/pids/server.pid

## Add Setup

EDITOR=vi rails credentials:edit
EDITOR=gedit rails credentials:edit

## Add into it

    stripe:

        secrete: secrete_key from stripe

    # aws:

        # access_key_id: 123

        # secret_access_key: 345

    # Used as the base secret for all MessageVerifiers in Rails, including the one protecting cookies.

    secret_key_base: 550da628969fde906a6774e17e6ae4e00ff87ae19efb232515b51a0bd6c11f5f6f2e1cc6387fa944681eb1eaf05d335055c3e720d857365a3c3c08af5eea139f

## Run the Server

bin/dev

## Again run

    stripe trigger customer.created

To show the customer.created "JOB ID" in console log
