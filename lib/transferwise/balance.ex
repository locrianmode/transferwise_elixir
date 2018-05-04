defmodule Transferwise.Balance do
  
  defstruct [
    balanceType: nil,
    amount:       %Transferwise.Amount{},
    bankDetails: %Transferwise.BankDetails{}
  ]

  @type t :: %__MODULE__{
    balanceType: String.t,
    amount:       Transferwise.Amount,
    bankDetails: Transferwise.BankDetails.t    
  }

end