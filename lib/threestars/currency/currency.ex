defmodule Threestars.Currency do
  @moduledoc """
  The Currency context.
  """

  import Ecto.Query, warn: false
  alias Threestars.Repo

  alias Threestars.Currency.Currencies

  @doc """
  Returns the list of currencies.

  ## Examples

      iex> list_currencies()
      [%Currencies{}, ...]

  """
  def list_currencies do
    Repo.all(Currencies)
  end

  @doc """
  Gets a single currencies.

  Raises `Ecto.NoResultsError` if the Currencies does not exist.

  ## Examples

      iex> get_currencies!(123)
      %Currencies{}

      iex> get_currencies!(456)
      ** (Ecto.NoResultsError)

  """
  def get_currencies!(id), do: Repo.get!(Currencies, id)

  @doc """
  Creates a currencies.

  ## Examples

      iex> create_currencies(%{field: value})
      {:ok, %Currencies{}}

      iex> create_currencies(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_currencies(attrs \\ %{}) do
    %Currencies{}
    |> Currencies.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a currencies.

  ## Examples

      iex> update_currencies(currencies, %{field: new_value})
      {:ok, %Currencies{}}

      iex> update_currencies(currencies, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_currencies(%Currencies{} = currencies, attrs) do
    currencies
    |> Currencies.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Currencies.

  ## Examples

      iex> delete_currencies(currencies)
      {:ok, %Currencies{}}

      iex> delete_currencies(currencies)
      {:error, %Ecto.Changeset{}}

  """
  def delete_currencies(%Currencies{} = currencies) do
    Repo.delete(currencies)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking currencies changes.

  ## Examples

      iex> change_currencies(currencies)
      %Ecto.Changeset{source: %Currencies{}}

  """
  def change_currencies(%Currencies{} = currencies) do
    Currencies.changeset(currencies, %{})
  end

  alias Threestars.Currency.Rate

  @doc """
  Returns the list of rate.

  ## Examples

      iex> list_rate()
      [%Rate{}, ...]

  """
  def list_rate do
    Repo.all(Rate)
  end

  @doc """
  Gets a single rate.

  Raises `Ecto.NoResultsError` if the Rate does not exist.

  ## Examples

      iex> get_rate!(123)
      %Rate{}

      iex> get_rate!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rate!(id), do: Repo.get!(Rate, id)

  @doc """
  Creates a rate.

  ## Examples

      iex> create_rate(%{field: value})
      {:ok, %Rate{}}

      iex> create_rate(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rate(attrs \\ %{}) do
    %Rate{}
    |> Rate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rate.

  ## Examples

      iex> update_rate(rate, %{field: new_value})
      {:ok, %Rate{}}

      iex> update_rate(rate, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rate(%Rate{} = rate, attrs) do
    rate
    |> Rate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Rate.

  ## Examples

      iex> delete_rate(rate)
      {:ok, %Rate{}}

      iex> delete_rate(rate)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rate(%Rate{} = rate) do
    Repo.delete(rate)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rate changes.

  ## Examples

      iex> change_rate(rate)
      %Ecto.Changeset{source: %Rate{}}

  """
  def change_rate(%Rate{} = rate) do
    Rate.changeset(rate, %{})
  end
end
