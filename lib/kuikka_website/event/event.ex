defmodule KuikkaWebsite.Event do
  @moduledoc """
  ## Table
  ```
  :title, :string, size: 255, null: false
  :content, :string, size: 5000, null: false
  :date, :utc_datetime, null: false
  ```
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}
  @type return :: {:ok, t} | {:error, Changeset}

  schema "events" do
    field :title, :string
    field :content, :string
    field :date, :utc_datetime
    many_to_many :comments, KuikkaWebsite.Event.Comment,
                                                join_through: "event_comments"
  end

  @doc """
  Changeset for inserting and updating schema
  """
  @spec changeset(t, Map.t) :: Ecto.Changeset.t
  def changeset(schema = %__MODULE__{}, params \\ %{}) do
    schema
    |> cast(params, [:title, :content, :date])
    |> validate_required([:title, :content, :date])
    |> validate_length(:title, min: 1)
    |> validate_length(:content, min: 1)
    |> validate_change(:date, &validate_date(&1))
    |> add_comment(params)
  end

  defp validate_date(date) do
    case Timex.compare(date, Timex.now()) do
      1 -> []
      _ -> [date: "Event date must greater than current time"]
    end
  end

  defp add_comment(changeset, %{comments: comments}),
    do: put_assoc(changeset, :comments, comments)
  defp add_comment(changeset, %{"comments" => comments}),
    do: put_assoc(changeset, :comments, comments)
  defp add_comment(changeset, _),
    do: changeset
end