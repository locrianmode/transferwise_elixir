defmodule Transferwise.AddressDetails do
  
  @enforce_keys [:country, :firstLine, :postCode, :city]
  defstruct [
    country:    nil,
    firstLine:  nil,
    postCode:   nil,
    city:       nil,
    state:      nil,
    occupation: nil
  ]

  @type t :: %__MODULE__{
    country:    String.t,
    firstLine:  String.t,
    postCode:   String.t,
    city:       String.t,
    state:      String.t,
    occupation: String.t
  }

end