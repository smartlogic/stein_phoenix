defmodule SteinPhoenix.MixProject do
  use Mix.Project

  def project do
    [
      app: :stein_phoenix,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      source_url: "https://github.com/smartlogic/stein",
      homepage_url: "https://github.com/smartlogic/stein",
      description: description(),
      package: package(),
      docs: [
        main: "readme",
        extras: ["README.md"]
      ],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix_html, "~> 2.13"}
    ]
  end

  def description() do
    """
    Stein Phoenix contains common helper functions to our Phoenix projects at SmartLogic.
    """
  end

  def package() do
    [
      maintainers: ["Eric Oestrich"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/smartlogic/stein_phoenix"}
    ]
  end
end
