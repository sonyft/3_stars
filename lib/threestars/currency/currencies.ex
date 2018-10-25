defmodule Threestars.Currency.Currencies do
  use Ecto.Schema
  import Ecto.Changeset


  schema "currencies" do
    field :code_digit, :integer
    field :code_symb, :string
    field :name, :string

    has_many(:rate, Threestars.Currency.Rate)

    timestamps()
  end

  @doc false
  def changeset(currencies, attrs) do
    currencies
    |> cast(attrs, [:code_digit, :code_symb, :name])
    |> validate_required([:code_digit, :code_symb, :name])
  end
end
