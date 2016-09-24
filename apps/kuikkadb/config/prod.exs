use Mix.Config

config :kuikkadb, KuikkaDB.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: System.get_env("KUIKKADB_DB") || "kuikka_prod",
  username: System.get_env("KUIKKADB_USER") || "postgres",
  password: System.get_env("KUIKKADB_PASSWORD") || "postgres",
  host: System.get_env("KUIKKADB_HOST") || "localhost"
