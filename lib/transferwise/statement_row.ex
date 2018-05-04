defmodule Transferwise.StatementRow do
  
  defstruct [
    id:                 nil,
    currency:           nil,
    amount:             nil,
    dateTime:           nil,
    paymentFee:         nil,
    date:               nil,
    paymentStatus:      nil,
    payeeName:          nil,
    payeeAccountNumber: nil,
    exchangeRate:       nil,
    description:        nil,
    senderName:         nil
  ]

  @type t :: %__MODULE__{
    id:                 String.t,
    currency:           String.t,
    amount:             number,
    dateTime:           String.t,
    paymentFee:         number,
    date:               String.t,
    paymentStatus:      String.t,
    payeeName:          String.t,
    payeeAccountNumber: String.t,
    exchangeRate:       number,
    description:        String.t,
    senderName:         String.t
  }
end