# ColorContrast.ex

An Elixir library to select black or white depending on the contrast to a
hexadecimal background color.

## Installation

The package can be installed by adding `color_contrast` to your list of
dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:color_contrast, "~> 1.1"}
  ]
end
```

The docs can be found at [https://hexdocs.pm/color_contrast](https://hexdocs.pm/color_contrast).

## Usage

Give it a hexadecimal string:

``` elixir
iex> ColorContrast.calc_contrast("#000000")
{:ok, "#FFFFFF"}
```

## License

MIT
