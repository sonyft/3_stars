defmodule Threestars.Repo.Migrations.AddColumnInvalidUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :invalid, :boolean
    end
  end
end
