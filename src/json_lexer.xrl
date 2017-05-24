Definitions.

KEYWORDS=null|true|false
SYMBOLS=[{}\[\]:,]
WHITESPACE=[\s\t\r\n]+
STRING="[^\"]+"
NUM=[0-9]+

Rules.

{STRING}     : {token, {string, TokenLine, extract_string(TokenChars)}}.
{KEYWORDS}   : {token, {list_to_atom(TokenChars), TokenLine}}.
{SYMBOLS} : {token, {list_to_atom(TokenChars), TokenLine}}.
{NUM}\.{NUM} : {token, {float, TokenLine, list_to_float(TokenChars)}}.
{NUM}        : {token, {int, TokenLine, list_to_integer(TokenChars)}}.
{WHITESPACE} : skip_token.

Erlang code.

extract_string(Chars) ->
    list_to_binary(lists:sublist(Chars, 2, length(Chars) - 2)).
