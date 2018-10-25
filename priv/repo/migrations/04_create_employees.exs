defmodule Threestars.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :name, :string
      add :email, :string
      add :phone, :string

      add(:positions_id, references(:positions, on_delete: :nothing))

      timestamps()
    end

  end
end
