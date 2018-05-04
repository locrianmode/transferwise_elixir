defmodule Transferwise.QuoteTest do
  use ExUnit.Case
  import TestHelper

  test "create a quote" do
    with_mock_request "quotes/create", fn ->

      {:ok, quot} = Transferwise.Quote.create( 
        %Transferwise.CreateQuote{
          profile: 3882,
          source: "GBP",
          target: "USD",
          rateType: "FIXED",
          sourceAmount: 600        
        }
      )

      assert %Transferwise.Quote{} = quot
      assert quot.id
      assert quot.source
      assert quot.target
      assert quot.sourceAmount
      assert quot.targetAmount
      assert quot.type
      assert quot.rateType
      assert quot.createdTime        
      assert quot.createdByUserId
      assert quot.rateType         
      assert quot.deliveryEstimate
      assert quot.fee     
      assert quot.allowedProfileTypes  
      assert quot.guaranteedTargetAmount == false
      assert quot.ofSourceAmount
    end    
  end

  test "get by id" do
    with_mock_request "quotes/get_by_id", fn ->
      {:ok, quot} = Transferwise.Quote.get_by_id(113293)

      assert %Transferwise.Quote{} = quot
      assert quot.id
      assert quot.source
      assert quot.target
      assert quot.sourceAmount
      assert quot.targetAmount
      assert quot.type
      assert quot.rateType
      assert quot.createdTime        
      assert quot.createdByUserId
      assert quot.rateType         
      assert quot.deliveryEstimate
      assert quot.fee     
      assert quot.allowedProfileTypes  
      assert quot.guaranteedTargetAmount == false
      assert quot.ofSourceAmount
    end
  end

  test "get pay-in methods" do
    with_mock_request "quotes/get_payin_methods", fn ->
      {:ok, methods} = Transferwise.Quote.get_payin_methods(113293)

      assert methods == [%{"details" => %{"payInReference" => "quote-113300 P304205"}, "type" => "transfer"}]
    end
  end

  test "get temporary quote" do
    with_mock_request "quotes/get_temporary_quote", fn ->
      {:ok, quot} = Transferwise.Quote.get_temporary_quote(
        source: "GBP",
        target: "USD",
        rateType: "FIXED",
        sourceAmount: 600,
        target_amount: 200        
      )

      assert %Transferwise.Quote{} = quot
      assert quot.source
      assert quot.target
      assert quot.sourceAmount
      assert quot.targetAmount
      assert quot.type
      assert quot.rateType
      assert quot.createdTime        
      assert quot.createdByUserId
      assert quot.rateType         
      assert quot.deliveryEstimate
      assert quot.fee     
      assert quot.allowedProfileTypes  
      assert quot.guaranteedTargetAmount == false
      assert quot.ofSourceAmount
    end
  end

  test "account requirements" do
    with_mock_request "quotes/account_requirements", fn ->
      {:ok, requirements} = Transferwise.Quote.account_requirements(123)
  
      Enum.each(requirements, fn(requirement) ->
        assert %Transferwise.Requirement{} = requirement
      end)
      
    end
  end

  test "refresh requirements" do
    account = 
    with_mock_request "accounts/get_by_id", fn ->
      {:ok, account} = Transferwise.Account.get_by_id(123)
      account
    end

    with_mock_request "quotes/refresh_requirements", fn ->
      {:ok, requirements} = Transferwise.Quote.refresh_requirements(123, account)

      assert requirements = [%Transferwise.Requirement{}]

    end
  end

end