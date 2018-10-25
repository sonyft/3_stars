defmodule Threestars.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :name, :string
      add :phone, :string
      add :email, :string
      add :position_id, references(:positions, on_delete: :nothing)

      timestamps()
    end

    create index(:employees, [:position_id])
  end
end
