defmodule Prepend do
  @moduledoc """
  Manipulates the Prepend CLI logic
  """

  def stream_lines(lines, prefix) do
    Stream.map(lines, &"#{prefix} #{&1}")
  end
end
