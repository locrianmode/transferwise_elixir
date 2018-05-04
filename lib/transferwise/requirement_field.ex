defmodule Transferwise.RequirementField do
  
  defstruct [
    name:   nil,
    group:  [%Transferwise.RequirementGroup{}]
  ]

  @type t :: %__MODULE__{
    name:   String.t,
    group:  [Transferwise.RequirementGroup]
  }
  
end