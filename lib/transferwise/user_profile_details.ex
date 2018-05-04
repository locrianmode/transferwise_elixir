defmodule Transferwise.UserProfileDetails do
  
  defstruct [
    first_name:             nil,
    last_name:              nil,
    dateOfBirth:            nil,
    phoneNumber:            nil,
    avatar:                 nil,
    occupation:             nil,
    name:                   nil,
    registrationNumber:     nil,
    acn:                    nil,
    bcn:                    nil,
    arbn:                   nil,
    companyType:            nil,
    companyRole:            nil,
    descriptionOfBusiness:  nil,
    webpage:                nil,
    primaryAddress:         nil
  ]

  @type t :: %__MODULE__{
    first_name:             String.t,
    last_name:              String.t,
    dateOfBirth:            String.t,
    phoneNumber:            String.t,
    avatar:                 String.t,
    occupation:             String.t,
    name:                   String.t,
    registrationNumber:     String.t,
    acn:                    String.t,
    bcn:                    String.t,
    arbn:                   String.t,
    companyType:            String.t,
    companyRole:            String.t,
    descriptionOfBusiness:  String.t,
    webpage:                String.t,
    primaryAddress:         integer
  }
end