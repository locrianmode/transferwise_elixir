defmodule Transferwise.ValidationAsyncParam do
  
  defstruct [
    key:            nil,
    parameterName:  nil,
    required:       nil
  ]

  @type t :: %__MODULE__{
    key:            String.t,
    parameterName:  String.t,
    required:       boolean
  }

end