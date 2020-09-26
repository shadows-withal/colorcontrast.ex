defmodule ColorContrastTest do
  use ExUnit.Case

  test "dark on light" do
    assert ColorContrast.color_contrast("#000000") == {:ok, "#ffffff"}
  end

  test "light on dark" do
    assert ColorContrast.color_contrast("#ffffff") == {:ok, "#000000"}
  end
end
