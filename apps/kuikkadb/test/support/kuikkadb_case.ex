defmodule KuikkaDB.TestCase do
  @moduledoc """
  This module defines the test case to be used by
  model tests.

  You may define functions here to be used as helpers in
  your model tests. See `errors_on/2`'s definition as reference.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """
  use ExUnit.CaseTemplate

  alias Ecto.Adapters.SQL.Sandbox

  using do
    quote do
      alias KuikkaDB.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import KuikkaDB.TestCase
    end
  end

  setup tags do
    :ok = Sandbox.checkout(KuikkaDB.Repo)

    unless tags[:async] do
      Sandbox.mode(KuikkaDB.Repo, {:shared, self()})
    end

    :ok
  end
end