defmodule Mix.Tasks.Npm.Clean do
  @moduledoc """
  Install npm packages required for frontend
  """

  @doc "Install frontend npm packages"
  @spec run(term) :: term
  def run(_) do
    Mix.Shell.IO.cmd("rm -rf assets/node_modules")
  end
end
