defmodule Transferwise.Transaction do
  
  defstruct [
    type:                     nil,
    id:                       nil,
    transactionId:            nil,
    state:                    nil,
    transactionCreationTime:  nil,
    creationTime:             nil,
    feeAmounts:               [%Transferwise.Amount{}],
    amount:                   %Transferwise.Amount{},
    sourceAmount:             %Transferwise.Amount{},
    targetAmount:             %Transferwise.Amount{},
    transferId:               nil,
    rate:                     nil
  ]

  @type t :: %__MODULE__{
    type:                     String.t,
    id:                       integer,
    transactionId:            integer,
    state:                    String.t,
    transactionCreationTime:  String.t,
    creationTime:             String.t,
    feeAmounts:               [Transferwise.Amount.t],
    amount:                   Transferwise.Amount.t,
    sourceAmount:             Transferwise.Amount.t,
    targetAmount:             Transferwise.Amount.t,
    transferId:               integer,
    rate:                     number
  }

end