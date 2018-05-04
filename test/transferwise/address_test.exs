defmodule Transferwise.AddressTest do
  use ExUnit.Case
  import TestHelper

  test "get requirements" do
    with_mock_request "addresses/get_requirements", fn ->
      {:ok, requirements} = Transferwise.Address.get_requirements
      assert [%Transferwise.Requirement{}] = requirements      
    end
  end

  test "refresh requirements" do
    with_mock_request "addresses/refresh_requirements", fn ->
      {:ok, requirements} = Transferwise.Address.refresh_requirements(%Transferwise.Address{
        profile: ""
      })
      assert [%Transferwise.Requirement{}] = requirements  
    end
  end

  test "create" do
    with_mock_request "addresses/create", fn ->
      {:ok, address} = Transferwise.Address.create(%Transferwise.Address{

      })

      assert %Transferwise.Address{} = address
      assert address.id == 236532
      assert address.profile == 217896
      assert %Transferwise.AddressDetails{} = address.details      
    end

  end

  test "get by id" do
    with_mock_request "addresses/get_by_id", fn ->
      {:ok, address} = Transferwise.Address.get_by_id(123)

      assert %Transferwise.Address{} = address
    end
  end

  test "list" do
    with_mock_request "addresses/list", fn ->
      {:ok, addresses} = Transferwise.Address.list(123)

      Enum.each(addresses, fn(address) ->
        assert address.profile
        assert %Transferwise.AddressDetails{} = address.details
      end)
      
    end
  end
  
end