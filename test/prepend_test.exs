defmodule PrependTest do
  use ExUnit.Case

  test "handles multiple words" do
    expected = ["I like ice cream", "I like pizza", "I like cats"]

    received =
      ["ice cream", "pizza", "cats"]
      |> Prepend.stream_lines("I like ")
      |> Enum.to_list()

    assert received == expected
  end
end
