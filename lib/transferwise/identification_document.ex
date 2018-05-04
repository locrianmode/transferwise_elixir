defmodule Transferwise.IdentificationDocument do
  
  defstruct [
    expiryDate:       nil,
    firstName:        nil,
    issueDate:        nil,
    issuerCountry:    nil,
    issuerState:      nil,
    lastName:         nil,
    type:              nil,
    uniqueIdentifier: nil
  ]

  @type t :: %__MODULE__{
    expiryDate:       String.t,
    firstName:        String.t,
    issueDate:        String.t,
    issuerCountry:    String.t,
    issuerState:      String.t,
    lastName:         String.t,
    type:             String.t,
    uniqueIdentifier: String.t
  }

end