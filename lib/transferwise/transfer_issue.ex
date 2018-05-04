defmodule Transferwise.TransferIssue do
  
  defstruct [
    type:         nil,
    state:        nil,
    description:  nil
  ]

  @type t :: %__MODULE__{
    type:         String.t,
    state:        String.t,
    description:  String.t
  }
end