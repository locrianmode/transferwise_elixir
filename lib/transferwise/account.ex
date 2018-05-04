defmodule Transferwise.Account do
  
  import Transferwise.HTTP

  @endpoint "/v1/accounts"

  @enforce_keys [:user, :profile, :accountHolderName, :currency, :type]
  defstruct [
    id:                 nil,
    user:               nil,
    profile:            nil,
    business:           nil,
    accountHolderName:  nil,
    currency:           nil,
    country:            nil,
    type:               nil,
    details:            %Transferwise.AccountDetails{}
  ]

  @type t :: %__MODULE__{
    id:                 integer,
    user:               integer,
    profile:            integer,
    business:           integer,
    accountHolderName:  String.t,
    currency:           String.t,
    country:            String.t,
    type:               String.t,
    details:            Transferwise.AccountDetails.t
  }

  def create(%Transferwise.Account{user: user, profile: profile, accountHolderName: account_holder_name, currency: currency, type: type} = params, opts \\ []) do
    opts = Keyword.merge(opts, as: %Transferwise.Account{user: user, profile: profile, accountHolderName: account_holder_name, currency: currency, type: type})
    post(@endpoint, Map.from_struct(params), opts)
  end

  def get_by_id(id, opts \\ []) do
    opts = Keyword.merge(opts, as: %Transferwise.Account{user: nil, profile: nil, accountHolderName: nil, currency: nil, type: nil})
    get("#{@endpoint}/#{id}", [], opts)
  end

  def list(opts \\ []) do
    opts = Keyword.merge(opts, as: [%Transferwise.Account{user: nil, profile: nil, accountHolderName: nil, currency: nil, type: nil}])
    get(@endpoint, [], opts)
  end

end