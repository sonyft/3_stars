defmodule Threestars.Repo.Migrations.CreateRate do
  use Ecto.Migration

  def change do
    create table(:rate) do
      add(:rate, :float)
      add(:date, :date)
      add(:currencies_id, references("currencies"))

      timestamps()
    end
  end
end
