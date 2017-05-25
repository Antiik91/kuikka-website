defmodule KuikkaDB.UserSchema do
  @moduledoc """
  ## Table
  ```
  :steamid, :decimal, size: 64, null: false
  :createtime, :utc_datetime, null: false
  :modifytime, :utc_datetime
  :role_id, references(:roles), null: false
  ```

  ## Index
  ```
  index(:users, :steamid, unique: true)
  ```
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}
  @type return :: {:ok, t} | {:error, Changeset}

  schema "users" do
    field :steamid, :decimal
    field :createtime, :utc_datetime
    field :modifytime, :utc_datetime
    belongs_to :role, KuikkaDB.RoleSchema, on_replace: :raise
    has_many :comments, KuikkaDB.CommentSchema
    field :profile, :map, virtual: true
  end

  @doc """
  Changeset for inserting and updating schema
  """
  @spec changeset(t, Map.t) :: Ecto.Changeset.t
  def changeset(schema = %__MODULE__{}, params \\ %{}) do
    schema
    |> cast(params, [:steamid, :createtime, :modifytime])
    |> validate_required([:steamid])
    |> add_time()
  end

  defp add_time(changeset) do
    if is_nil(get_change(changeset, :createtime)) do
      put_change(changeset, :createtime, Timex.now())
    else
      put_change(changeset, :modifytime, Timex.now())
    end
  end
end
