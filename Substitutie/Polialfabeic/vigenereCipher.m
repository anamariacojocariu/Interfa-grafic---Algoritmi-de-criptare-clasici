% function vigenereCipher()
%     % Solicitare de la utilizator a textului clar și a cheii
%     text_clar = input('Introduceți textul clar (fără spații): ', 's');
%     cheia = input('Introduceți cheia (fără spații): ', 's');
% 
%     % Conversia textului și cheii la litere mari pentru consistență
%     text_clar = upper(text_clar);
%     cheia = upper(cheia);
% 
%     % Criptare
%     text_cifrat = vigenereCipher(text_clar, cheia);
%     fprintf('Text cifrat: %s\n', text_cifrat);
% 
%     % % Decriptare
%     % text_decriptat = vigenereDecrypt(text_cifrat, cheia);
%     % fprintf('Text decriptat: %s\n', text_decriptat);
% end

function text_cifrat = vigenereCipher(text_clar, cheia)

    % Conversia textului și cheii la litere mari pentru consistență
     text_clar = upper(text_clar);
     cheia = upper(cheia);

     % Elimină spațiile din textul clar
    text_clar = strrep(text_clar, ' ', '');  % Elimină toate spațiile

    % Transformă textul clar și cheia în valori numerice (A=0, ..., Z=25)
    text_clar_num = double(text_clar) - 'A';
    cheia_num = double(repmat(cheia, 1, ceil(length(text_clar) / length(cheia)))) - 'A';
    cheia_num = cheia_num(1:length(text_clar));

    % Aplică formula de criptare: C = (P + K) mod 26
    text_cifrat_num = mod(text_clar_num + cheia_num, 26);

    % Transformă rezultatul în litere
    text_cifrat = char(text_cifrat_num + 'A');
end

% function text_decriptat = vigenereDecrypt(text_cifrat, cheia)
%     % Transformă textul cifrat și cheia în valori numerice (A=0, ..., Z=25)
%     text_cifrat_num = double(text_cifrat) - 'A';
%     cheia_num = double(repmat(cheia, 1, ceil(length(text_cifrat) / length(cheia)))) - 'A';
%     cheia_num = cheia_num(1:length(text_cifrat));
% 
%     % Aplică formula de decriptare: P = (C - K + 26) mod 26
%     text_decriptat_num = mod(text_cifrat_num - cheia_num + 26, 26);
% 
%     % Transformă rezultatul în litere
%     text_decriptat = char(text_decriptat_num + 'A');
% end
