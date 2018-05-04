defmodule Transferwise.ExchangeRateTest do
  use ExUnit.Case
  import TestHelper
  import Mock

  test "get exchange rates" do
    with_mock_request "exchange-rates/get", fn ->

      {:ok, exchange_rates} = Transferwise.ExchangeRate.get(%{
        source: "",
        target: ""
      })
    end

  end
  
end