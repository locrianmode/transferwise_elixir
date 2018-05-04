defmodule Transferwise.User do
  
  import Transferwise.HTTP
  
  @endpoint "/v1/users"

  defstruct [
    id:       nil,
    name:     nil,
    email:    nil,
    active:   nil
    # details:  %Transferwise.Users.UserDetails{}
  ]

  @type t :: %__MODULE__{
    id:       nil,
    name:     nil,
    email:    nil,
    active:   nil
    # details:  Transferwise.Users.UserDetails.t
  }

  def sign_up_with_registration_code(%Transferwise.RegistrationCodeRequest{} = params, opts \\ []) do
    opts = Keyword.merge(opts, as: %__MODULE__{})
    post("/v1/user/signup/registration_code", params, opts)
  end

  def get_by_id(id, opts \\ []) do
    opts = Keyword.merge(opts, as: %__MODULE__{})
    get("#{@endpoint}/#{id}", [], opts)
  end

end