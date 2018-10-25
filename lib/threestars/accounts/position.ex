defmodule Threestars.Accounts.Position do
  use Ecto.Schema
  import Ecto.Changeset

  schema "positions" do
    field(:name, :string)

    has_many(:employees, Threestars.Accounts.Employees)

    timestamps()
  end

  @doc false
  def changeset(position, attrs) do
    position
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
