defmodule KuikkaDB.Roles do
  @moduledoc """
  ## Table
  ```
  :name, :string, size: 50, null: false
  :description, :string, size: 250, null: true
  ```

  ## Index
  ```
  index(:roles, [:name], unique: true)
  ```
  """
  use Defql

  @doc """
  Get row
  """
  @spec get(Keyword.t) :: {:ok | :error, term}
  defselect get(conds), table: :roles

  @doc """
  Insert new row
  """
  @spec insert(Keyword.t) :: {:ok | :error, term}
  definsert insert(params), table: :roles

  @doc """
  Update row
  """
  @spec update(Keyword.t, Keyword.t) :: {:ok | :error, term}
  defupdate update(params, conds), table: :roles

  @doc """
  Delete row
  """
  @spec delete(Keyword.t) :: {:ok | :error, term}
  defdelete delete(conds), table: :roles
end
