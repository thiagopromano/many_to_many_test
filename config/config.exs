# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :many_to_many_test,
  ecto_repos: [ManyToManyTest.Repo]

# Configures the endpoint
config :many_to_many_test, ManyToManyTestWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: ManyToManyTestWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ManyToManyTest.PubSub,
  live_view: [signing_salt: "RoTvjnup"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :many_to_many_test, ManyToManyTest.Mailer, adapter: Swoosh.Adapters.Local

import_config "#{config_env()}.exs"
