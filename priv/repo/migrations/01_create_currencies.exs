defmodule Threestars.Repo.Migrations.CreateCurrencies do
  use Ecto.Migration

  def change do
    create table(:currencies) do
      add(:code_digit, :integer)
      add(:code_symb, :string)
      add(:name, :string)

      timestamps()
    end
  end
end
