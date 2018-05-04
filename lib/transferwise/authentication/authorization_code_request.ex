defmodule Transferwise.Authentication.AuthorizationCodeRequest do
  
  defstruct [
    grant_type:   "String.t",
    client_id:    nil,
    redirect_uri: nil,
    code:         nil
  ]

  @type t :: %__MODULE__ {
    grant_type:   String.t,
    client_id:    String.t,
    redirect_uri: String.t, # format: uri
    code:         String.t    
  }

end