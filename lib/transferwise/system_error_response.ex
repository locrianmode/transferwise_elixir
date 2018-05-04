defmodule Transferwise.SystemErrorResponse do
  
  defstruct [
    timestamp:  nil,
    status:     nil,
    error:      nil,
    exception:  nil,
    errors:     [%Transferwise.Error{}],
    message:    nil,
    path:       nil
  ]

  @type t :: %__MODULE__{
    timestamp:  nil,
    status:     nil,
    error:      nil,
    exception:  nil,
    errors:     [Transferwise.Error.t],
    message:    nil,
    path:       nil
  }
  
end