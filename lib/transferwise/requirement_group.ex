defmodule Transferwise.RequirementGroup do
  
  defstruct [
    displayFormat:                nil,
    example:                      nil,
    key:                          nil,
    maxLength:                    nil,
    minLength:                    nil,
    refreshRequirementsOnChange:  nil,
    required:                     nil,
    type:                         nil,
    validationAsync:              %Transferwise.ValidationAsync{},
    validationRegexp:             nil,
    valuesAllowed:                [%Transferwise.ValueAllowed{}]
  ]

  @type t :: %__MODULE__{
    displayFormat:                String.t,
    example:                      String.t,
    key:                          String.t,
    maxLength:                    integer,
    minLength:                    integer,
    refreshRequirementsOnChange:  boolean,
    required:                     boolean,
    type:                         String.t,
    validationAsync:              Transferwise.ValidationAsync,
    validationRegexp:             String.t,
    valuesAllowed:                [Transferwise.ValueAllowed]
  }
  
end