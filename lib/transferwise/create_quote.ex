defmodule Transferwise.CreateQuote do
  
  @enforce_keys [:profile, :source, :target, :rateType]  
  defstruct [
    profile:      nil,
    source:       nil,
    target:       nil,
    rateType:     nil,
    sourceAmount: nil,
    targetAmount: nil
  ]

  @type t :: %__MODULE__{
    profile:      integer,
    source:       String.t,
    target:       String.t,
    rateType:     String.t,
    sourceAmount: number,
    targetAmount: number
  }
  
end