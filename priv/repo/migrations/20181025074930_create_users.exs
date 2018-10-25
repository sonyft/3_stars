defmodule Threestars.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :password_hash, :string
      add :person_id, references(:employees, on_delete: :nothing)

      timestamps()
    end

    create index(:users, [:person_id])
  end
end
