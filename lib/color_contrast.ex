defmodule ColorContrast do
  @moduledoc ColorContrast.MixProject.project()[:description]

  @brightness_threshold 130
  @black_hex "#000000"
  @white_hex "#FFFFFF"

  @doc """
  Calculates the contrast with a background color.

  ## Examples

  Accept a color value in different hex formats.

      iex> ColorContrast.calc_contrast("#000000")
      {:ok, "#FFFFFF"}

      iex> ColorContrast.calc_contrast("#ffffff")
      {:ok, "#000000"}

      iex> ColorContrast.calc_contrast("000000")
      {:ok, "#FFFFFF"}

      iex> ColorContrast.calc_contrast("ffffff")
      {:ok, "#000000"}

  Show an error for an invalid color hex value.

      iex> ColorContrast.calc_contrast("#1234567")
      {:error, :invalid_bg_color_hex_value}

      iex> ColorContrast.calc_contrast("#12345z")
      {:error, :invalid_bg_color_hex_value}

      iex> ColorContrast.calc_contrast("12345z")
      {:error, :invalid_bg_color_hex_value}

  """
  @spec calc_contrast(String.t()) :: {:ok, String.t()} | {:error, atom()}
  def calc_contrast(<<"#", red::bytes-2, green::bytes-2, blue::bytes-2>> = _bg_color_hex) do
    do_calc_contrast(red, green, blue)
  end

  def calc_contrast(<<red::bytes-2, green::bytes-2, blue::bytes-2>> = _bg_color_hex) do
    do_calc_contrast(red, green, blue)
  end

  def calc_contrast(_invalid_hex) do
    {:error, :invalid_bg_color_hex_value}
  end

  defp do_calc_contrast(red, green, blue) do
    case calc_perceived_brightness(red, green, blue) do
      :error ->
        {:error, :invalid_bg_color_hex_value}

      brightness ->
        {:ok, fg_color(brightness)}
    end
  end

  defp calc_perceived_brightness(red, green, blue) do
    with {red, ""} <- Integer.parse(red, 16),
         {green, ""} <- Integer.parse(green, 16),
         {blue, ""} <- Integer.parse(blue, 16) do
      :math.sqrt(
        red * red * 0.241 +
          green * green * 0.691 +
          blue * blue * 0.068
      )
    else
      _error -> :error
    end
  end

  defp fg_color(brightness) when brightness > @brightness_threshold do
    @black_hex
  end

  defp fg_color(_brightness) do
    @white_hex
  end
end
