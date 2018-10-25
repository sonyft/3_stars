defmodule Threestars.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:user_name, :string)
      add(:password_hash, :string)
      add(:employees_id, references(:employees, on_delete: :nothing))
      add(:invalid, :boolean)

      timestamps()
    end
  end
end
