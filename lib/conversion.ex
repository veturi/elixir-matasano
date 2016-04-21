defmodule Matasano.Conversion do
  @doc ~S"""
  Converts the given base16 encoded (hexadecimal) `string` into base64 encoded `string`

  ## Examples
      iex> Matasano.Conversion.hex_to_base64("ABC123")
      "q8Ej"
  """
  @spec hex_to_base64(String.t) :: String.t
  def hex_to_base64(""), do: ""

  def hex_to_base64 string do
    Base.decode16!(string, case: :mixed) |> Base.encode64()
  end
end
