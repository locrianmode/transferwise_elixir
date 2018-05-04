defmodule Transferwise.ValidationAsync do
  
  defstruct [
    url:    nil,
    params: [%Transferwise.ValidationAsyncParam{}]
  ]

  @type t :: %__MODULE__{
    url:    String.t,
    params: [Transferwise.ValidationAsyncParam.t]
  }
  
end