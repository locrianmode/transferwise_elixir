ExUnit.start()

defmodule TestHelper do
  use ExUnit.Case
  import Mock

  def with_mock_request(path, fun) do
    with_mock HTTPoison, [request!: fn(_, _, _, _, _)  -> mock_request(path) end] do      
      fun.()
    end
  end

  defp mock_request(path) do
    response =
    File.read!("./test/fixtures/api.transferwise.com/#{path}.json")
    %HTTPoison.Response{body: response, status_code: 200}
  end
end