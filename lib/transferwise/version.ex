defmodule Transferwise.Version do
  
  def project_version do
    "0.0.1"
  end

  def api_version do
    Application.get_env(:transferwise, :api_version)
  end

  def elixir_version do
    System.version
  end

end