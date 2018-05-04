defmodule Transferwise.Address do
  
  import Transferwise.HTTP
  
  @endpoint "/v1/addresses"

  @enforce_keys []
  defstruct [
    id:       nil,
    profile:  nil,
    details:  %Transferwise.AddressDetails{
      country:    nil,
      firstLine:  nil,
      postCode:   nil,
      city:       nil
    }
  ]

  @type t :: %__MODULE__{
    id:       integer,
    profile:  integer,
    details:  Transferwise.AddressDetails.t
  }

  def get_requirements(opts \\ []) do
    opts = Keyword.merge(opts, as: [%Transferwise.Requirement{}])
    get("/v1/address-requirements", [], opts)
  end

  def refresh_requirements(%Transferwise.Address{profile: profile} = params, opts \\ []) do
    opts = Keyword.merge(opts, as: [%Transferwise.Requirement{}])
    post("/v1/address-requirements", params, opts)
  end

  def create(%Transferwise.Address{profile: profile} = params, opts \\ []) do
    opts = Keyword.merge(opts, as: %__MODULE__{})
    post(@endpoint, params, opts)
  end

  def get_by_id(id, opts \\ []) do
    opts = Keyword.merge(opts, as: %__MODULE__{})
    get("#{@endpoint}/#{id}", [], opts)
  end

  def list(id, opts \\ []) do
    opts = Keyword.merge(opts, as: [%__MODULE__{}])
    get(@endpoint, [profile: id], opts)
  end

end