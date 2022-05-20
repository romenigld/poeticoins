import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :poeticoins, PoeticoinsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "NAIeOqruUppjB1FwjDWn3lcufGn7mmITg8uSUB4o1yuxR88WNtkSEJ7AzHcBrN5J",
  server: false

# In test we don't send emails.
config :poeticoins, Poeticoins.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :poeticoins, :children, [
  PoeticoinsWeb.Telemetry,
  {Phoenix.PubSub, name: Poeticoins.PubSub},
  PoeticoinsWeb.Endpoint
]
