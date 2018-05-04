defmodule Transferwise.Authentication.UnauthorizedError do
  
  defstruct [
    timestamp:  nil,
    status:     nil,
    error:      "Unauthorized",
    messge:     "Bad credentials",
    path:       "/oauth/token"
  ]

  @type t :: %__MODULE__{
    timestamp:  String.t,
    status:     integer,
    error:      String.t,
    messge:     String.ts,
    path:       String.t    
  }
end