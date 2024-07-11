% Definimos el conjunto de caracteres Base64:
base64_chars("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/").

% Convertimos cada caracter ASCII a su codigo ASCII:
char_to_ascii(Char, Code) :-
    char_code(Char, Code).

% Convertimos un codigo ASCII a binario de 8 bits
ascii_to_bin(Ascii, Bin) :-
    format(atom(Bin), '~`0t~2r~8|', [Ascii]).

% Convertimos una cadena binaria ASCII a una lista de cadenas binariass
ascii_string_to_binary_list(AsciiString, BinaryList) :-
    string_chars(AsciiString, Chars),
    maplist(char_to_ascii, Chars, AsciiCodes),
    maplist(ascii_to_bin, AsciiCodes, BinaryList).

% Dividimos la cadena binaria para que sea multiplo de 6 bits
pad_binary(Bin, PaddedBin) :-
    string_length(Bin, Length),
    Padding is (6 - (Length mod 6)) mod 6,
    pad_binary_helper(Bin, Padding, PaddedBin).

pad_binary_helper(Bin, 0, Bin).
pad_binary_helper(Bin, Padding, PaddedBin) :-
    Padding > 0,
    atom_concat(Bin, "0", TempBin),
    NewPadding is Padding - 1,
    pad_binary_helper(TempBin, NewPadding, PaddedBin).

% Convertimos una cadena binaria a una lista de chunks de 6 bits
bin_to_chunks(Bin, Chunks) :-
    string_length(Bin, Length),
    ( Length >= 6 ->
        sub_atom(Bin, 0, 6, Rest, Chunk),
        sub_atom(Bin, 6, Rest, 0, RemainingBin),
        bin_to_chunks(RemainingBin, RestChunks),
        Chunks = [Chunk | RestChunks]
    ; Chunks = [] ).

%%%% Esto se puede hacer de manera mas eficiente
% Convertimos un bit string a numero
bit_value('0', 0).
bit_value('1', 1).

% Convertimos una cadena binaria a su valor decimal
bin_to_decimal(Bin, Dec) :-
    string_chars(Bin, Chars),
    bin_to_decimal_helper(Chars, 0, Dec).

bin_to_decimal_helper([], Dec, Dec).
bin_to_decimal_helper([Bit|Rest], Acc, Dec) :-
    bit_value(Bit, BitValue),
    NewAcc is Acc * 2 + BitValue,
    bin_to_decimal_helper(Rest, NewAcc, Dec).
%%%%

% Convertimos un chunk de 6 bits a su valor Base64 decimal
bin_to_base64_value(Bin, Value) :-
    bin_to_decimal(Bin, Value).

% Mapeamos un valor Base64 decimal a su caracter correspondiente
value_to_base64_char(Value, Char) :-
    base64_chars(Base64Chars),
    sub_atom(Base64Chars, Value, 1, _, Char).

% Convertimos chunks binarios a una cadena Base64
chunks_to_base64_string([], []).
chunks_to_base64_string([Chunk|Rest], [Char|RestChars]) :-
    bin_to_base64_value(Chunk, Value),
    value_to_base64_char(Value, Char),
    chunks_to_base64_string(Rest, RestChars).

% Convertimos una cadena ASCII a una cadena Base64
ascii_to_base64(AsciiString, Base64String) :-
    ascii_string_to_binary_list(AsciiString, BinaryList),
    atomic_list_concat(BinaryList, AllBinary),
    pad_binary(AllBinary, PaddedBinary),
    bin_to_chunks(PaddedBinary, Chunks),
    chunks_to_base64_string(Chunks, Base64Chars),
    atomic_list_concat(Base64Chars, TempBase64String),

    % Agregar caracteres de padding
    string_length(AsciiString, InputLength),
    PaddingLength is (3 - (InputLength mod 3)) mod 3,
    (PaddingLength == 0 -> Base64String = TempBase64String ;
     PaddingLength == 1 -> atom_concat(TempBase64String, "=", Base64String) ;
     atom_concat(TempBase64String, "==", Base64String)).

% Funcion principal para convertir una cadena ASCII a Base64
convert_to_base64(Input, Output) :-
    ascii_to_base64(Input, Output).

% Ejemplo:
% ?- convert_to_base64("hola", Base64).