defmodule Transferwise.Amount do
  
  defstruct [
    value:    nil,
    currency: nil
  ]

  @type t :: %__MODULE__{
    value:    number,
    currency: String.t
  }
end