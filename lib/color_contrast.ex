defmodule ColorContrast do
  def color_contrast(hex) do
    # Check if the hex includes a hash character
    unhashed = get_unhashed(hex)

    with red <- String.slice(unhashed, 0..1) |> String.to_integer(16),
         green <- String.slice(unhashed, 2..3) |> String.to_integer(16),
         blue <- String.slice(unhashed, 4..5) |> String.to_integer(16),
         contrast <- :math.sqrt(red * red * 0.241 + green * green * 0.691 + blue * blue * 0.068) do
      cond do
        contrast > 130 -> {:ok, "#000000"}
        true -> {:ok, "#ffffff"}
      end
    end
  end

  defp get_unhashed(hex) do
    if String.at(hex, 0) == "#", do: String.slice(hex, 1..6), else: hex
  end
end
