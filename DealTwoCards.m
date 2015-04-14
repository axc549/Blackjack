function [playerStruct,numplayers,continueplay,selector]=DealTwoCards(Deck,playerStruct,numplayers,selector)
fprintf('\n')
for player = 1:numplayers+1
    movenext = 1;
    % Deals 2 Cards
    [Deck,playerStruct,selector,movenext,card1] = DealCard(Deck,playerStruct,selector,player,1,movenext);
    [~,cardtext1] = CardInfo(card1);
    [Deck,playerStruct,selector,~,card2] = DealCard(Deck,playerStruct,selector,player,1,movenext);
    [~,cardtext2] = CardInfo(card2);
    if player <= numplayers
        fprintf('%s is showing a %s %s %s and a %s %s %s.\n',playerStruct(player).name,cardtext1{:},cardtext2{:})
    else
        fprintf('Dealer showing a %s %s %s.\n', cardtext1{:})
    end
    continueplay = 1;
    % Checks whether there's a blackjack
    if BestScore(playerStruct,player,1) == 21
        % blackjack counter
        playerStruct(player).win = 1;
        if player <= numplayers
            disp('Blackjack!!')
         elseif player > numplayers
            disp('Dealer has Blackjack!!')
            [cardtext1,cardtext2] = ShowCards(playerStruct,player,1);
            fprintf('Dealer has a: %s %s %s and %s %s %s.\n',cardtext1{:}, cardtext2{:})
            continueplay = 1;
        end
    end 
end
end