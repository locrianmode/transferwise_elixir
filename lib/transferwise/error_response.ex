defmodule Transferwise.ErrorResponse do
  
  defstruct [
    errors: []
  ]

  @type t :: %__MODULE__{
    errors: [Transferwise.Error.t]
  }
  
end