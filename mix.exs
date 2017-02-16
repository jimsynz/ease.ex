defmodule Ease.Mixfile do
  use Mix.Project

  def project do
    [app: :ease,
     description: description(),
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package(),
     deps: deps()]
  end

  def description do
    """
    Simple implementation of standard animation easing functions.
    """
  end

  def package do
    [
      maintainers: [ "James Harton <james@messagerocket.co>" ],
      licenses: [ "MIT" ],
      links: %{
        "Source" => "https://github.com/jamesotron/ease.ex"
      }
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
