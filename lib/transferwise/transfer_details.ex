defmodule Transferwise.TransferDetails do
  
  defstruct [
    reference:          nil,
    sourceOfFunds:      nil,
    sourceOfFundsOther: nil
  ]

  @type t :: %__MODULE__{
    reference:          String.t,
    sourceOfFunds:      String.t,
    sourceOfFundsOther: String.t
  }

end