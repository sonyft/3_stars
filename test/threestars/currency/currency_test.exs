defmodule Threestars.CurrencyTest do
  use Threestars.DataCase

  alias Threestars.Currency

  describe "currencies" do
    alias Threestars.Currency.Currencies

    @valid_attrs %{code_digit: 42, code_symb: "some code_symb", name: "some name"}
    @update_attrs %{code_digit: 43, code_symb: "some updated code_symb", name: "some updated name"}
    @invalid_attrs %{code_digit: nil, code_symb: nil, name: nil}

    def currencies_fixture(attrs \\ %{}) do
      {:ok, currencies} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Currency.create_currencies()

      currencies
    end

    test "list_currencies/0 returns all currencies" do
      currencies = currencies_fixture()
      assert Currency.list_currencies() == [currencies]
    end

    test "get_currencies!/1 returns the currencies with given id" do
      currencies = currencies_fixture()
      assert Currency.get_currencies!(currencies.id) == currencies
    end

    test "create_currencies/1 with valid data creates a currencies" do
      assert {:ok, %Currencies{} = currencies} = Currency.create_currencies(@valid_attrs)
      assert currencies.code_digit == 42
      assert currencies.code_symb == "some code_symb"
      assert currencies.name == "some name"
    end

    test "create_currencies/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Currency.create_currencies(@invalid_attrs)
    end

    test "update_currencies/2 with valid data updates the currencies" do
      currencies = currencies_fixture()
      assert {:ok, currencies} = Currency.update_currencies(currencies, @update_attrs)
      assert %Currencies{} = currencies
      assert currencies.code_digit == 43
      assert currencies.code_symb == "some updated code_symb"
      assert currencies.name == "some updated name"
    end

    test "update_currencies/2 with invalid data returns error changeset" do
      currencies = currencies_fixture()
      assert {:error, %Ecto.Changeset{}} = Currency.update_currencies(currencies, @invalid_attrs)
      assert currencies == Currency.get_currencies!(currencies.id)
    end

    test "delete_currencies/1 deletes the currencies" do
      currencies = currencies_fixture()
      assert {:ok, %Currencies{}} = Currency.delete_currencies(currencies)
      assert_raise Ecto.NoResultsError, fn -> Currency.get_currencies!(currencies.id) end
    end

    test "change_currencies/1 returns a currencies changeset" do
      currencies = currencies_fixture()
      assert %Ecto.Changeset{} = Currency.change_currencies(currencies)
    end
  end

  describe "rate" do
    alias Threestars.Currency.Rate

    @valid_attrs %{rate: 120.5}
    @update_attrs %{rate: 456.7}
    @invalid_attrs %{rate: nil}

    def rate_fixture(attrs \\ %{}) do
      {:ok, rate} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Currency.create_rate()

      rate
    end

    test "list_rate/0 returns all rate" do
      rate = rate_fixture()
      assert Currency.list_rate() == [rate]
    end

    test "get_rate!/1 returns the rate with given id" do
      rate = rate_fixture()
      assert Currency.get_rate!(rate.id) == rate
    end

    test "create_rate/1 with valid data creates a rate" do
      assert {:ok, %Rate{} = rate} = Currency.create_rate(@valid_attrs)
      assert rate.rate == 120.5
    end

    test "create_rate/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Currency.create_rate(@invalid_attrs)
    end

    test "update_rate/2 with valid data updates the rate" do
      rate = rate_fixture()
      assert {:ok, rate} = Currency.update_rate(rate, @update_attrs)
      assert %Rate{} = rate
      assert rate.rate == 456.7
    end

    test "update_rate/2 with invalid data returns error changeset" do
      rate = rate_fixture()
      assert {:error, %Ecto.Changeset{}} = Currency.update_rate(rate, @invalid_attrs)
      assert rate == Currency.get_rate!(rate.id)
    end

    test "delete_rate/1 deletes the rate" do
      rate = rate_fixture()
      assert {:ok, %Rate{}} = Currency.delete_rate(rate)
      assert_raise Ecto.NoResultsError, fn -> Currency.get_rate!(rate.id) end
    end

    test "change_rate/1 returns a rate changeset" do
      rate = rate_fixture()
      assert %Ecto.Changeset{} = Currency.change_rate(rate)
    end
  end
end
