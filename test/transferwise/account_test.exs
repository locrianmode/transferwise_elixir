defmodule Transferwise.AccountTest do
  use ExUnit.Case
  import TestHelper

  test "create" do
    with_mock_request "accounts/create", fn ->
      {:ok, account} = Transferwise.Account.create(%Transferwise.Account{
        user: 294205,
        accountHolderName: "Joe Paymee",
        currency: "USD",
        country: "US",
        profile: 3882,
        type: "aba",
        details: %Transferwise.AccountDetails{
          legalType: "PRIVATE",
          address: %Transferwise.AddressDetails{
            city: "New York",
            country: "US",
            postCode: "10025",
            state: "NY",
            firstLine: "158 Wall Street"
          },
          abartn: "321171184",
          accountType: "CHECKING",
          accountNumber: "40031299023",
          email: "example@foobar.com"
        }
      })
    end
  end

  test "get account by id" do
    with_mock_request "accounts/get_by_id", fn ->
      {:ok, account} = Transferwise.Account.get_by_id(123)
      assert account.id
      assert account.user
      assert account.profile
      assert account.business
      assert account.accountHolderName
      assert account.currency
      assert account.country
      assert account.type
      assert account.details
    end
  end

  test "list accounts" do
    with_mock_request "accounts/list", fn ->
      {:ok, accounts} = Transferwise.Account.list
      Enum.each(accounts, fn(account) -> 
        assert account.id
        assert account.user
        assert account.profile
        assert account.accountHolderName
        assert account.currency
        assert account.country
        assert account.type
        assert account.details
      end)
    end
  end

end