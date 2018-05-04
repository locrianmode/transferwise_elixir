defmodule Transferwise.CreateTransfer do
  
  defstruct [
    targetAccount:          nil,
    quote:                  nil,
    sourceAccount:          nil,
    customerTransactionId:  nil,
    details:                %Transferwise.TransferDetails{}
  ]

  @type t :: %__MODULE__{
    targetAccount:          integer,
    quote:                  integer,
    sourceAccount:          integer,
    customerTransactionId:  String.t    
  }

end