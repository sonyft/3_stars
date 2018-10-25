defmodule Threestars.Currency.Rate do
  use Ecto.Schema
  import Ecto.Changeset


  schema "rate" do
    belongs_to(:currencies, Threestars.Currency.Currencies)
    field :rate, :float

    timestamps()
  end

  @doc false
  def changeset(rate, attrs) do
    rate
    |> cast(attrs, [:rate, :currencies_id])
    |> validate_required([:rate, :currencies_id])
  end
end
