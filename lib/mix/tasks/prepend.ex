defmodule Mix.Tasks.Prepend do
  @moduledoc false

  use Mix.Task

  @shortdoc "Prepend the lines from a standard input (stdin) with a given prefix"
  def run(args) do
    Prepend.CLI.main(args)
  end
end
