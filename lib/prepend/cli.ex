defmodule Prepend.CLI do
  @moduledoc """
  Prepend is a command line utility to prepend a given string to lines

  ./prepend '$ ' < file.txt
  """

  def main(lines \\ []) do
    output = IO.stream(:stdio, :line)

    output
    |> Prepend.stream_lines(Enum.join(lines, " "))
    |> Stream.into(output)
    |> Stream.run()
  end
end
