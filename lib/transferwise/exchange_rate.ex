defmodule Transferwise.ExchangeRate do
  
  import Transferwise.HTTP
  
  @endpoint "/v1/rates"

  defstruct [
    rate:   nil,
    source: nil,
    target: nil,
    time:   nil
  ]

  @type t :: %__MODULE__{
    rate:   number,
    source: String.t,
    target: String.t,
    time:   String.t
  }

  def get(params, opts \\ []) do
    opts = Keyword.merge(opts, as: [%Transferwise.ExchangeRate{}])
    get(@endpoint, params, opts)
  end
  
end