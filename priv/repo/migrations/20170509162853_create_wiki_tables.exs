defmodule KuikkaDB.Repo.Migrations.CreateWikiTable do
  use Ecto.Migration

  def change do
    create table(:wikipages) do
      add :title, :text, null: false
      add :content, :text, null: false
      add :createtime, :utc_datetime, null: false
      add :edittime, :utc_datetime, null: false
      add :public, :boolean, null: false
    end
  end
end