defmodule ElisaExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :elisa_example,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
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
      {:nx, "~> 0.5.0"},
      {:nimble_csv, "~> 1.1"},
      {:vega_lite, "~> 0.1.9"},
      {:explorer, "~> 0.8.0"},
    ]
  end
end
