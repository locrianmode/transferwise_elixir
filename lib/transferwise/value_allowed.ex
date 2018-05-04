defmodule Transferwise.ValueAllowed do
  
  defstruct [
    key:  nil,
    name: nil
  ]

  @type t :: %__MODULE__{
    key:  String.t,
    name: String.t
  }
  
end