function Deck = MakeDeck(numplayers)
if numplayers == 1
    deckmin = 1;
elseif numplayers < 8
    deckmin = numplayers - 1;
else
    deckmin = 6;
end
numDecks = 0;
while numDecks < deckmin || numDecks > 99
    fprintf('Input # of Decks (%d-99)',deckmin)
    numDecks = input(': ');
    if numDecks > 99
        disp('No one needs that many decks. Try less than 100')
    end
end
deck1 = 1:52;
Deck = repmat(deck1,1,numDecks); % repeats deck so it has enought for n number of decks
Deck(:,randperm(size(Deck,2))) = Deck; % randomizes deck
end