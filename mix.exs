defmodule Instream.Mixfile do
  use Mix.Project

  @url_github "https://github.com/mneudert/instream"

  def project do
    [ app:     :instream,
      name:    "Instream",
      version: "0.10.0-dev",
      elixir:  "~> 1.0",
      deps:    deps,

      build_embedded:  Mix.env == :prod,
      start_permanent: Mix.env == :prod,

      description:   "InfluxDB driver for Elixir",
      docs:          docs,
      package:       package,
      test_coverage: [ tool: ExCoveralls ] ]
  end

  def application do
    [ applications: [ :hackney, :poison, :poolboy ] ]
  end

  defp deps do
    [ { :earmark, "~> 0.2",  only: :docs },
      { :ex_doc,  "~> 0.11", only: :docs },

      { :dialyze,     "~> 0.2", only: :test },
      { :excoveralls, "~> 0.4", only: :test },

      { :hackney, "~> 1.1" },
      { :poison,  "~> 1.4 or ~> 2.0" },
      { :poolboy, "~> 1.5" } ]
  end

  defp docs do
    [ extras:     [ "CHANGELOG.md", "README.md" ],
      main:       "readme",
      source_ref: "master",
      source_url: @url_github ]
  end

  defp package do
    %{ files:       [ "CHANGELOG.md", "LICENSE", "mix.exs", "README.md", "lib" ],
       licenses:    [ "Apache 2.0" ],
       links:       %{ "GitHub" => @url_github },
       maintainers: [ "Marc Neudert" ] }
  end
end
