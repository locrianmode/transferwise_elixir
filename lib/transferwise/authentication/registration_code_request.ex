defmodule Transferwise.Authentication.RegistationCodeRequest do
  
  defstruct [
    grant_type:     "refresh_token",
    refresh_token:  nil # format: uuid
  ]

  @type t :: %__MODULE__{
    grant_type:     String.t,
    refresh_token:  String.t
  }

end