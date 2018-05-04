defmodule Transferwise.UserTest do
  use ExUnit.Case
  import TestHelper

  test "sign up with registration code" do
    with_mock_request "users/sign_up_with_registration_code", fn ->
      {:ok, user} = Transferwise.User.sign_up_with_registration_code(
        %Transferwise.RegistrationCodeRequest{
          email: "",
          registrationCode: ""
        }
      )

      assert %Transferwise.User{} = user
      assert user.id
      assert is_nil(user.name)
      assert user.email
    end
  end

  test "get by id" do
    with_mock_request "users/get_by_id", fn -> 
      {:ok, user} = Transferwise.User.get_by_id(123)

      assert %Transferwise.User{} = user
      assert user.id == 294205
      assert user.name == "Lauri Hein"
    end
  end

end