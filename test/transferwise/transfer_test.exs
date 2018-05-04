defmodule Transferwise.TransferTest do
  use ExUnit.Case
  import TestHelper

  test "refresh requirements" do
    with_mock_request "transfers/refresh_requirements-post", fn ->
      {:ok, requirements} = Transferwise.Transfer.refresh_requirements(%Transferwise.CreateTransfer{        
        targetAccount: 8561521,
        quote: 110046,
        details: %Transferwise.TransferDetails{
          reference: "good times",
          sourceOfFunds: "verification.source.of.funds.other",
          sourceOfFundsOther: "Trust funds"
        },
        customerTransactionId: "6D9188CF-FA59-44C3-87A2-4506CE9C1EA3"
      })

      Enum.each(requirements, fn(requirement) ->
        assert %Transferwise.Requirement{} = requirement
      end)

    end
  end

  test "create transfer" do
    with_mock_request "transfers/create-post", fn ->
      {:ok, transfer} = Transferwise.Transfer.create(%Transferwise.CreateTransfer{        
          targetAccount: 8561521,
          quote: 110046,
          details: %Transferwise.TransferDetails{
            reference: "good times",
            sourceOfFunds: "verification.source.of.funds.other",
            sourceOfFundsOther: "Trust funds"
          },
          customerTransactionId: "6D9188CF-FA59-44C3-87A2-4506CE9C1EA3"
      })

      assert %Transferwise.Transfer{} = transfer
    end
  end

  test "fund transfer" do
    with_mock_request "transfers/fund-post", fn ->
      {:ok, response} = Transferwise.Transfer.fund(123, %{type: "BALANCE"})
      assert %{
        "type" => "BALANCE",
        "status" => "COMPLETED",
        "errorCode" => null
      } = response
    end
  end

  test "get transfer by id" do
    with_mock_request "transfers/get_by_id-get", fn ->
      {:ok, transfer} = Transferwise.Transfer.get_by_id(123)
      assert %Transferwise.Transfer{} = transfer
    end
  end

  test "get transfer issues" do
    with_mock_request "transfers/get_issues-get", fn ->
      {:ok, transfer_issues} = Transferwise.Transfer.get_issues(123)
      assert [%Transferwise.TransferIssue{description: "Incorrect recipient account number", state: "OPENED", type: "Payment has bounced back"}] = transfer_issues 
    end
  end

  test "list transfers" do
    with_mock_request "transfers/list-get", fn ->
      {:ok, transfers} = Transferwise.Transfer.list(%{})

      Enum.each(transfers, fn(transfer) ->
        assert %Transferwise.Transfer{} = transfer
      end)
    end
  end
  
end