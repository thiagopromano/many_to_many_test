import Config

# Configure your database
config :many_to_many_test, ManyToManyTest.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "many_to_many_test_dev",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
