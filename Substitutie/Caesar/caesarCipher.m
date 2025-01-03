% Funcție pentru criptarea unui text cu algoritmul Caesar
%function caesarCipher()
    % % Solicităm utilizatorului să introducă textul original
    % textOriginal = input('Introduceți textul original: ', 's');
    % 
    % % Solicităm utilizatorului să introducă cheia de criptare
    % key = input('Introduceți cheia (un număr întreg): ');
    % 
    % % Criptare
    % textCifrat = caesarEncrypt(textOriginal, key);
    % disp(['Text cifrat: ', textCifrat]);
    % 
    % % Decriptare
    % textDecriptat = caesarDecrypt(textCifrat, key);
    % disp(['Text decriptat: ', textDecriptat]);
%end

function textCriptat = caesarCipher(textOriginal, key)

    % Conversia textului la litere mari pentru consistență
     textOriginal = upper(textOriginal);

    % Convertim textul în format ASCII
    textASCII = double(textOriginal);

    % Aplicăm criptarea doar pentru litere (majuscule și minuscule)
    for i = 1:length(textASCII)
        if isletter(textOriginal(i))
            if isstrprop(textOriginal(i), 'lower')
                % Criptare pentru litere mici
                textASCII(i) = mod(textASCII(i) - double('a') + key, 26) + double('a');
            elseif isstrprop(textOriginal(i), 'upper')
                % Criptare pentru litere mari
                textASCII(i) = mod(textASCII(i) - double('A') + key, 26) + double('A');
            end
        end
    end

    % Convertim înapoi în caractere
    textCriptat = char(textASCII);
end

% function textDecriptat = caesarDecrypt(textCifrat, key)
%     % Convertim textul în format ASCII
%     textASCII = double(textCifrat);
% 
%     % Aplicăm decriptarea doar pentru litere (majuscule și minuscule)
%     for i = 1:length(textASCII)
%         if isletter(textCifrat(i))
%             if isstrprop(textCifrat(i), 'lower')
%                 % Decriptare pentru litere mici
%                 textASCII(i) = mod(textASCII(i) - double('a') - key + 26, 26) + double('a');
%             elseif isstrprop(textCifrat(i), 'upper')
%                 % Decriptare pentru litere mari
%                 textASCII(i) = mod(textASCII(i) - double('A') - key + 26, 26) + double('A');
%             end
%         end
%     end
% 
%     % Convertim înapoi în caractere
%     textDecriptat = char(textASCII);
% end
