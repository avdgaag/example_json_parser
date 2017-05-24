defmodule JsonParser do
  def parse(str) do
    with {:ok, tokens, _} <- :json_lexer.string(to_char_list(str)),
         {:ok, result} <- :json_parser.parse(tokens)
    do
      result
    else
      {:error, reason, _} ->
        reason
      {:error, {_, :json_parser, reason}} ->
        to_string(reason)
    end
  end
end
