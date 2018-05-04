defmodule Transferwise.Quote do
  
  import Transferwise.HTTP
  
  @endpoint "/v1/quotes"
  
  defstruct [
    id:                     nil,
    source:                 nil,
    target:                 nil,
    sourceAmount:           nil,
    targetAmount:           nil,
    type:                   nil,
    rate:                   nil,
    createdTime:            nil,
    createdByUserId:        nil,
    rateType:               nil,
    deliveryEstimate:       nil,
    fee:                    nil,
    allowedProfileTypes:    nil,
    guaranteedTargetAmount: nil,
    ofSourceAmount:         nil
  ]

  @type t :: %__MODULE__{
    id:                     integer,
    source:                 String.t,
    target:                 String.t,
    sourceAmount:           number,
    targetAmount:           number,
    type:                   String.t,
    rate:                   number,
    createdTime:            String.t,
    createdByUserId:        integer,
    rateType:               String.t,
    deliveryEstimate:       String.t,
    fee:                    number,
    allowedProfileTypes:    [],
    guaranteedTargetAmount: boolean,
    ofSourceAmount:         boolean 
  }

  @doc """

  ## Examples

      {:ok, quote} = Transferwise.Quote.create(
        %Transferwise.CreateQuote{
          profile: 3882, 
          source: "GBP", 
          target: "USD", 
          rateType: "FIXED", 
          sourceAmount: 600})

  """
  def create(params = %Transferwise.CreateQuote{}, opts \\ []) do
    opts = Keyword.merge(opts, as: %Transferwise.Quote{})
    post(@endpoint, params, opts)
  end

  @doc """

  ## Examples

      {:ok, quote} = Transferwise.Quote.get_by_id(123)

  """  
  def get_by_id(id, opts \\ []) do
    opts = Keyword.merge(opts, as: %Transferwise.Quote{})
    get("#{@endpoint}/#{id}", [], opts)
  end

  @doc """

  ## Examples

      {:ok, payin_methods} = Transferwise.Quote.get_payin_methods(123)

  """
  def get_payin_methods(id, opts \\ []) do
    opts = Keyword.merge(opts, as: [])
    get("#{@endpoint}/#{id}/pay-in-methods", [], opts)    
  end

  @doc """

  ## Examples

      {:ok, quote} = Transferwise.Quote.get_temporary_quote(123)

  """
  def get_temporary_quote(params, opts \\ []) do
    opts = Keyword.merge(opts, as: %Transferwise.Quote{})
    get(@endpoint, params, opts)
  end

  @doc """

  ## Examples

      {:ok, requirements} = Transferwise.Quote.account_requirements(123)

  """
  def account_requirements(id, opts \\ []) do
    opts = Keyword.merge(opts, as: [%Transferwise.Requirement{}])
    get("#{@endpoint}/#{id}/account-requirements", [], opts)    
  end

  @doc """

  ## Examples

      {:ok, requirements} = Transferwise.Quote.refresh_requirements(123)

  """  
  def refresh_requirements(id, %Transferwise.Account{} = params, opts \\ []) do
    opts = Keyword.merge(opts, as: [%Transferwise.Requirement{}])
    post("#{@endpoint}/#{id}/account-requirements", [], opts)    
  end
  
end