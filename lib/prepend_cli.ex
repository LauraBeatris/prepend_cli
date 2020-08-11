defmodule Prepend do
  @moduledoc """
  Manipulates the Prepend CLI logic
  """

  @doc """
  Prepend a given string to each line of a list
  and return a Stream with the itineration result

  # Example:

  iex> ["one", "two"] |> Prepend.stream_lines("$ ") |> Enum.to_list
  ["$ one", "$ two"]
  """

  @spec stream_lines(Enumerable.t(), String.t()) :: Enumerable.t()
  def stream_lines(lines, prefix) do
    Stream.map(lines, &(prefix <> &1))
  end
end
