defmodule Threestars.Accounts.Employee do
  use Ecto.Schema
  import Ecto.Changeset


  schema "employees" do
    field :email, :string
    field :name, :string
    field :phone, :string
    field :position_id, :id

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:name, :phone, :email])
    |> validate_required([:name, :phone, :email])
  end
end
