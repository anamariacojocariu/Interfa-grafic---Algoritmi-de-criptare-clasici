% function columnarCipher()
%     % Solicităm utilizatorului să introducă textul original
%     textOriginal = input('Introduceți textul original: ', 's');
% 
%     % Solicităm utilizatorului să introducă cheia
%     cheie = input('Introduceți cheia (un șir de caractere sau numere): ', 's');
% 
%     % Convertim cheia într-un vector numeric
%       if ischar(cheie)
%         cheie = double(cheie); % Transformăm cheia în codurile ASCII ale caracterelor
%     end
% 
%     % Criptare
%     textCifrat = columnarEncrypt(textOriginal, cheie);
%     disp(['Text criptat: ', textCifrat]);
% end

function textCriptat = columnarCipher(textOriginal, cheie)
    % Funcție pentru criptarea unui text utilizând algoritmul columnar
    % textOriginal - textul care trebuie criptat (text clar)
    % cheie - un șir de caractere sau numere ce reprezintă cheia pentru ordinea coloanelor
    
% Convertim cheia într-un vector numeric
    if ischar(cheie)
         cheie = double(cheie); % Transformăm cheia în codurile ASCII ale caracterelor
    end

    % Eliminăm spațiile din textul original
    textOriginal = strrep(textOriginal, ' ', ''); 
    
    % Determinăm lungimea textului și dimensiunea matricei
    n = length(textOriginal);
    keyLength = length(cheie);
    
    % Determinăm numărul de rânduri necesare în matrice
    numRows = ceil(n / keyLength);

    % Completăm textul original cu caractere suplimentare '*' dacă este necesar
    paddingLength = numRows * keyLength - n;
    textOriginal = [textOriginal, repmat('*', 1, paddingLength)];

    % Construim matricea de transpunere
    matrice = reshape(textOriginal, keyLength, numRows)'; % Matrice transpusă pentru citirea pe coloane

    % Sortăm cheia și obținem ordinea corectă a coloanelor
    [~, ordineaColoanelor] = sort(cheie);

    % Construim textul criptat citind matricea conform ordinii coloanelor
    textCriptat = '';
    for i = 1:keyLength
        col = ordineaColoanelor(i); % Indexul coloanei ordonate
        textCriptat = [textCriptat, matrice(:, col)']; % Adăugăm coloana în textul criptat
    end
end


