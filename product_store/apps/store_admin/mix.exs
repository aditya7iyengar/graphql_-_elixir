defmodule StoreAdmin.MixProject do
  use Mix.Project

  def project do
    [
      app: :store_admin,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :products, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:common_graphql_client, "~> 0.6.0"},
      {:httpoison, "~> 1.7.0"},
      {:products, in_umbrella: true}
    ]
  end
end
