defmodule Transferwise.Authentication.ClientCredentialsRequest do
  
  defstruct [
    grant_type: "client_credentials"
  ]

  @type t :: %__MODULE__{
    grant_type: String.t
  }

end