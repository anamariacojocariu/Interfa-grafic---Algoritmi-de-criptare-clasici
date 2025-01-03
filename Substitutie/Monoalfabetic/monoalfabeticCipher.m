% function monoalfabeticCipher()
%     % Solicităm utilizatorului să introducă textul original
%     textOriginal = input('Introduceți textul original: ', 's');
% 
%     % Solicităm utilizatorului să introducă cheia de criptare
%     % Cheia trebuie să fie un șir de 26 de litere distincte (substituție monoalfabetică)
%     cheie = input('Introduceți cheia (26 litere distincte): ', 's');
% 
%     % Validăm cheia
%     if length(cheie) ~= 26 || length(unique(cheie)) ~= 26
%         error('Cheia trebuie să conțină exact 26 de litere distincte.');
%     end
% 
%     % Criptare
%     textCifrat = monoalphabeticEncrypt(textOriginal, cheie);
%     disp(['Text cifrat: ', textCifrat]);
% end

function textCriptat = monoalfabeticCipher(textOriginal, cheie)
    % Funcție pentru criptarea unui text utilizând substituție monoalfabetică

    % cheie - șirul de caractere ce reprezintă alfabetul substitut (26 litere)
    
    
    % Validăm cheia
     if length(cheie) ~= 26 || length(unique(cheie)) ~= 26
         error('Cheia trebuie să conțină exact 26 de litere distincte.');
     end

    % Alfabetul standard (pentru litere mici)
    alfabet = 'abcdefghijklmnopqrstuvwxyz';

    % Convertim textul original la litere mici pentru consistență
    textOriginal = lower(textOriginal);

    % Inițializăm textul criptat
    textCriptat = '';

    % Parcurgem fiecare caracter din textul original
    for i = 1:length(textOriginal)
        litera = textOriginal(i);

        if isletter(litera) % Dacă este o literă, o înlocuim
            % Găsim poziția literei în alfabet
            pozitie = find(alfabet == litera);
            % Înlocuim cu litera corespunzătoare din cheie
            textCriptat = [textCriptat, cheie(pozitie)];
        else
            % Dacă nu este literă, o păstrăm (spații, cifre, semne de punctuație)
            textCriptat = [textCriptat, litera];
        end
    end
end
