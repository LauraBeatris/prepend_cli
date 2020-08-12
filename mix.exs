defmodule PrependCli.MixProject do
  use Mix.Project

  def project do
    [
      app: :prepend,
      version: "0.1.0",
      elixir: "~> 1.10",
      escript: [main_module: Prepend.CLI],
      start_permanent: Mix.env() == :prod,
      build_embedded: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :stream_data]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:stream_data, "~> 0.4.2", only: [:dev, :test], runtime: false}
    ]
  end
end
