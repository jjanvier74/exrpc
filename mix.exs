defmodule Exrpc.MixProject do
  use Mix.Project

  @version "0.4.2"
  @url "https://github.com/ukazap/exrpc"

  def project do
    [
      app: :exrpc,
      description: "Lean Elixir RPC library based on RESP (REdis Serialization Protocol)",
      package: package(),
      version: @version,
      elixir: "~> 1.15.8",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def package do
    [
      maintainers: ["Ukaza Perdana"],
      licenses: ["MIT"],
      links: %{GitHub: @url}
    ]
  end

  defp deps do
    [
      {:benchee, "~> 1.3.1", only: :test},
      {:credo, "~> 1.7.8", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.30.9", only: :dev, runtime: false},
      {:memoize, "~> 1.4.3"},
      {:plug_crypto, "~> 2.1.0"},
      {:redix, "~> 1.5.2"},
      {:sobelow, "~> 0.13.0", only: [:dev, :test], runtime: false},
      {:thousand_island, "~> 0.6.7"}
    ]
  end

  defp docs do
    [
      main: "Exrpc",
      source_ref: @version,
      source_url: @url
    ]
  end

  defp aliases do
    [
      check: ["format --check-formatted", "credo --strict", "sobelow"]
    ]
  end
end
