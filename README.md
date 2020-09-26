# ColorContrast.ex

An Elixir library to select black or white according to a hexadecimal background color.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `color_contrast` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:color_contrast, "~> 0.1.0"}
  ]
end
```

## Usage

Give it a hexadecimal string:

``` elixir
ColorContrast.color_contrast("#000000") # => "#ffffff"
```

## License

MIT
