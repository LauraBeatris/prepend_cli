defmodule PrependTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  doctest Prepend

  test "prepend string to lines" do
    expected = ["R$ one", "R$ two", "R$ three"]

    received =
      ["one", "two", "three"]
      |> Prepend.stream_lines("R$ ")
      |> Enum.to_list()

    assert expected == received
  end

  test "handles multiple words" do
    expected = ["I like ice cream", "I like pizza", "I like cats"]

    received =
      ["ice cream", "pizza", "cats"]
      |> Prepend.stream_lines("I like ")
      |> Enum.to_list()

    assert received == expected
  end

  @tag timeout: 300_000
  property "streams" do
    check all(
            lines <- list_of(string(:printable)),
            prefix <- string(:printable),
            max_runs: 20
          ) do
      lines
      |> Prepend.stream_lines(prefix)
      |> Stream.each(&String.starts_with?(&1, prefix))
    end
  end
end
