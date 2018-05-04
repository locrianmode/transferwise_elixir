defmodule Transferwise.Authentication.TokensResponse do
  
  defstruct [
    access_token:   nil,
    token_type:     "bearer",
    refresh_token:  nil,
    expires_in:     nil,
    scope:          nil
  ]

  @type t :: %__MODULE__{
    access_token:   String.t,
    token_type:     String.t,
    refresh_token:  String.t,
    expires_in:     integer,
    scope:          String.t 
  }

end