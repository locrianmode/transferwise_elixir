defmodule Transferwise.BorderlessAccountTest do
  use ExUnit.Case
  import TestHelper

  test "search account by user profile" do
    with_mock_request "borderless-account/search_by_user_profile-get", fn ->
      {:ok, borderless_account} = Transferwise.BorderlessAccount.search_by_user_profile(123)
      assert %Transferwise.BorderlessAccount{} = borderless_account
    end
  end

  test "get account balances" do
    with_mock_request "borderless-account/get_account_balances-get", fn ->
      {:ok, borderless_accounts} = Transferwise.BorderlessAccount.get_account_balances(123)
      Enum.each(borderless_accounts, fn(borderless_account) ->
        assert %Transferwise.BorderlessAccount{} = borderless_account
      end)
    end
  end

  test "get account transactions" do
    with_mock_request "borderless-account/get_account_transactions-get", fn ->
      {:ok, transactions} = Transferwise.BorderlessAccount.get_account_transactions(123, %{})
      Enum.each(transactions, fn(transaction) ->
        assert %Transferwise.Transaction{} = transaction
      end)
    end
  end

  test "get account statement" do
    with_mock_request "borderless-account/get_account_statement-get", fn ->
      {:ok, statement_rows} = Transferwise.BorderlessAccount.get_account_statement(%{profileId: 123, currency: "SGD", startDate: "", endDate: ""})
      Enum.each(statement_rows, fn(statement_row) ->
        assert %Transferwise.StatementRow{} = statement_row
      end)
    end
  end

  test "get available currencies" do
    with_mock_request "borderless-account/get_available_currencies-get", fn ->
      {:ok, currencies} = Transferwise.BorderlessAccount.get_available_currencies
      Enum.each(currencies, fn(currency) ->
        assert currency["code"]
      end)
    end
  end

end