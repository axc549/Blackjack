function [Deck,playerStruct,selector,movenext,card] = DealCard(Deck,playerStruct,selector,player,row,movenext)
% selects a card
card = Deck(selector);
% storing the card
playerStruct(player).cards(row,movenext) = card;
movenext = movenext + 1;

%Reshuffling or not
if selector < length(Deck)/2
    selector = selector + 1;
else
    disp('Dealt half of the cards. Reshuffling')
    dealtCards = [];
    for i = 1:length(playerStruct)
    dealtCards = [dealtCards playerStruct(i).cards(find(playerStruct(i).cards(:)'))];
    end  % there has got to be a better way of finding all the dealt cards
    notDealtCards = setdiff(Deck,dealtCards);
    Deck = [dealtCards notDealtCards(:,randperm(size(notDealtCards,2)))];
    selector = length(dealtCards)+1;
end
end
