defmodule Transferwise.BorderlessAccount do
      
  import Transferwise.HTTP
  
  @endpoint "/v1/borderless-accounts"

  defstruct [
    id:                 nil,
    profileId:          nil,
    recipientId:        nil,
    creationTime:       nil,
    modificationTime:   nil,
    active:             nil,
    balances:           [%Transferwise.Balance{}]
  ]

  @type t :: %__MODULE__{
    id:                 integer,
    profileId:          integer,
    recipientId:        integer,
    creationTime:       String.t,
    modificationTime:   String.t,
    active:             boolean,
    balances:           [Transferwise.Balance.t]
  }

  def search_by_user_profile(id, opts \\ []) do
    opts = Keyword.merge(opts, as: %__MODULE__{})
    get(@endpoint, %{profileId: id}, opts)  
  end

  def get_account_balances(id, opts \\ []) do
    opts = Keyword.merge(opts, as: [%__MODULE__{}])
    get("#{@endpoint}/#{id}", [], opts)    
  end

  def get_account_transactions(id, params, opts \\ []) do
    opts = Keyword.merge(opts, as: [%Transferwise.Transaction{}])
    get("#{@endpoint}/#{id}/transaction", params, opts)    
  end

  def get_account_statement(%{profileId: profileId, currency: currency, startDate: startDate, endDate: endDate} = params, opts \\ []) do
    opts = Keyword.merge(opts, as: [%Transferwise.StatementRow{}])
    get("#{@endpoint}/statement", params, opts)        
  end

  def get_available_currencies(opts \\ []) do
    opts = Keyword.merge(opts, as: [])
    get("#{@endpoint}/balance-currencies", [], opts)
  end

end