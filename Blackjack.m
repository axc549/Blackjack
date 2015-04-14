% Initial Inputs (if starting a new game)
% -----------------
    % Creates Players and Associated Arrays
    [playerStruct,numplayers] = MakePlayerArrays();
    % Making the Deck
    Deck = MakeDeck(numplayers);

quitgame = 0;
selector = 1; % starts dealing from card 1
while length(playerStruct) > 1 && quitgame ~= 1
    % Bets
    [playerStruct,numplayers] = MakeBets(playerStruct,numplayers);
    % Deal 2 Cards to everyone
    [playerStruct,numplayers,continueplay,selector] = DealTwoCards(Deck,playerStruct,numplayers,selector);
    % Does Splits
    [playerStruct,selector]=Split(Deck,playerStruct,numplayers,selector);
    % Dealing Further Cards if Necessary
    if continueplay == 1
        % Dealing More Cards
        [playerStruct,numplayers,selector]=DealMoreCards(Deck,playerStruct,numplayers,selector);
        % Dealer's Turn
        [playerStruct,selector,movenext] = TheDealer(Deck,playerStruct,selector,numplayers); 
            %does continueplay need to be in Dealer?
    end
    % Winning and Payout
    playerStruct = WhoWon(playerStruct,numplayers);
    % Cleanup
    playerStruct = CleanUp(playerStruct,numplayers);
    % Quit Game
    quitgame = QuitGame(playerStruct,numplayers);
end

%{
TO DO:
Fix the whowon function so it goes by player
add money
make it multi round
change 'continueplay' to 'playpastdealerblackjack'

TO CHECK
% make some decks to make sure that the whole thing works alright
%}