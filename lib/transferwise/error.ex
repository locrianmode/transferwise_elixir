defmodule Transferwise.Error do
  
  defstruct [
    code:       nil,
    message:    nil,
    arguments:  []
  ]

  @type t :: %__MODULE__{
    code:       String.t,
    message:    String.t,
    arguments:  [String.t]
  }

end