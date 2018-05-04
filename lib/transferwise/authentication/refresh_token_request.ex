defmodule Transferwise.Authentication.RefreshTokenRequest do
  
  defstruct [
    grant_type:     "refresh_token",
    refresh_token:  nil
  ]

  @type t :: %__MODULE__{
    grant_type:     String.t,
    refresh_token:  String.t # format: uuid
  }
  
end