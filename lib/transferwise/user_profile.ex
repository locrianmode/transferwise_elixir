defmodule Transferwise.UserProfile do
  
  import Transferwise.HTTP
  
  @endpoint "/v1/profiles"

  defstruct [
    id:       nil,
    type:     nil,
    details:  %Transferwise.UserProfileDetails{}
  ]

  @type t :: %__MODULE__{
    id:       integer,
    type:     String.t,
    details:  Transferwise.UserProfileDetails.t    
  }

  def create(%Transferwise.UserProfile{} = params, opts \\ []) do
    opts = Keyword.merge(opts, as: %__MODULE__{})
    post(@endpoint, params, opts)
  end

  def get_by_id(id, opts \\ []) do
    opts = Keyword.merge(opts, as: %__MODULE__{})
    get("#{@endpoint}/#{id}", [], opts)
  end

  def list(opts \\ []) do
    opts = Keyword.merge(opts, [%__MODULE__{}])
    get(@endpoint, [], opts)
  end

  def update(%Transferwise.UserProfile{} = params, opts \\ []) do
    opts = Keyword.merge(opts, [%__MODULE__{}])
    put(@endpoint, params, opts)    
  end

  def create_identification_document(id, %Transferwise.IdentificationDocument{} = params, opts \\ []) do
    opts = Keyword.merge(opts, as: nil)
    post("#{@endpoint}/#{id}/verification-documents", params, opts)
  end
   
end