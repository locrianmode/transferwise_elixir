defmodule Transferwise.RegistrationCodeRequest do

  @enforce_keys [:email, :registrationCode]  
  defstruct [
    email:            nil,
    registrationCode: nil
  ]

  @type t :: %__MODULE__{
    email:            String.t,
    registrationCode: String
  }

end