defmodule ColorContrast.MixProject do
  use Mix.Project

  def project do
    [
      app: :color_contrast,
      version: "1.0.0",
      elixir: "~> 1.10",
      description: description(),
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://github.com/thcz/colorcontrast.ex"
    ]
  end

  defp description do
    "A library that selects black or white depending on contrast with a chosen background color."
  end

  defp package do
    [
      name: "color_contrast",
      files: ~w(lib .formatter.exs mix.exs README.md LICENSE),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/thcz/colorcontrast.ex"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
