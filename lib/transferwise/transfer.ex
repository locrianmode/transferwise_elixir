defmodule Transferwise.Transfer do
    
  import Transferwise.HTTP
  
  @endpoint "/v1/transfers"

  defstruct [
    id:                     nil,
    user:                   nil,
    targetAccount:          nil,
    sourceAccount:          nil,
    quote:                  nil,
    status:                 nil,
    reference:              nil,
    rate:                   nil,
    created:                nil,
    business:               nil,
    transferRequest:        nil,
    details:                %Transferwise.TransferDetails{},
    hasActiveIssues:        nil,
    sourceValue:            nil,
    sourceCurrency:         nil,
    targetValue:            nil,
    targetCurrency:         nil,
    customerTransactionId:  nil
  ]

  @type t :: %__MODULE__{
    id:                     integer,
    user:                   integer,
    targetAccount:          integer,
    sourceAccount:          nil,
    quote:                  integer,
    status:                 String.t,
    reference:              String.t,
    rate:                   number,
    created:                String.t,
    business:               nil,
    transferRequest:        nil,
    details:                %Transferwise.TransferDetails{},
    hasActiveIssues:        boolean,
    sourceValue:            number,
    sourceCurrency:         String.t,
    targetValue:            number,
    targetCurrency:         String.t,
    customerTransactionId:  String.t
  }

  @doc """

  ## Examples

  TODO:
      {:ok, requirement} = Transferwise.Transfer.refresh_requirements()

  """
  def refresh_requirements(params, opts \\ []) do
    opts = Keyword.merge(opts, as: [%Transferwise.Requirement{}])
    post("#{@endpoint}-requirements", params, opts)
  end

  @doc """

  ## Examples

  TODO:
      {:ok, transfer} = Transferwise.Transfer.create

  """
  def create(params = %Transferwise.CreateTransfer{}, opts \\ []) do
    opts = Keyword.merge(opts, as: %Transferwise.Transfer{})    
    post(@endpoint, params, opts)
  end

  @doc """

  TODO:
  ## Examples

      {:ok, fund} = Transferwise.Transfer.fund

  """
  # POST /v1/transfers/{transferId}/payments
  def fund(id, params, opts \\ []) do
    opts = Keyword.merge(opts, as: %{})
    post("#{@endpoint}/#{id}/payments", params, opts)
  end

  @doc """
  """
  def get_by_id(id, opts \\ []) do
    opts = Keyword.merge(opts, as: %Transferwise.Transfer{})
    get("#{@endpoint}/#{id}", [], opts)
  end

  @doc """
  """
  # GET /v1/transfers/{transferId}/issues
  def get_issues(id, opts \\ []) do
    opts = Keyword.merge(opts, as: [%Transferwise.TransferIssue{}])
    get("#{@endpoint}/#{id}/issues", [], opts)    
  end

  # GET /v1/transfers
  def list(params, opts \\ []) do
    opts = Keyword.merge(opts, as: [%Transferwise.Transfer{}])
    get("#{@endpoint}", params, opts)    
  end

end