defmodule Transferwise.BankDetails do
  
  defstruct [
    id:                 nil,
    currency:           nil,
    bankCode:           nil,
    accountNumber:      nil,
    bankName:           nil,
    accountHolderName:  nil,
    bankAddress:        %Transferwise.BankAddress{},
    swift:              nil,
    iban:               nil
  ]

  @type t :: %__MODULE__{
    id:                 integer,
    currency:           String.t,
    bankCode:           String.t,
    accountNumber:      String.t,
    bankName:           String.t,
    accountHolderName:  String.t,
    bankAddress:        Transferwise.BankAddress.t,
    swift:              String.t,
    iban:               String.t    
  }
  
end