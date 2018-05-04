defmodule Transferwise.Requirement do
  
  defstruct [
    type:   nil,
    fields: [%Transferwise.RequirementField{}]
  ]

  @type t :: %__MODULE__{
    type:   String.t,
    fields: [Transferwise.RequirementField]
  }
  
end