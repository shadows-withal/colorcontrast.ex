defmodule ColorContrast.MixProject do
  use Mix.Project

  @source_url "https://github.com/thcz/colorcontrast.ex"
  @version "1.0.0"

  def project do
    [
      app: :color_contrast,
      version: @version,
      elixir: "~> 1.10",
      description: description(),
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      source_url: @source_url
    ]
  end

  defp description do
    """
    A library that selects black or white depending on contrast with a chosen
    background color.
    """
  end

  defp package do
    [
      name: "color_contrast",
      files: ~w(lib .formatter.exs mix.exs README.md LICENSE),
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.22", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      main: "ColorContrast",
      source_ref: "v#{@version}",
      source_url: @source_url,
      extras: [
        "README.md"
      ]
    ]
  end
end
