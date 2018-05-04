defmodule Transferwise.Authentication.InvalidGrantError do
  
  defstruct [
    error:              "invalid_grant",
    error_description:  nil
  ]

  @type t :: %__MODULE__{
    error:              String.t,
    error_description:  String.t
  }

end