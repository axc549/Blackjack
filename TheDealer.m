function [playerStruct,selector,movenext]=TheDealer(Deck,playerStruct,selector,numplayers)
    movenext = 3; % moves in playerArray to store value
    player = numplayers+1;
    % show cards
    [cardtext1,cardtext2] = ShowCards(playerStruct,player,1);
    fprintf('\nDealer is up. Dealer has a: %s %s %s and a %s %s %s.\n',cardtext1{:}, cardtext2{:})
    
    while BestScore(playerStruct,player,1) < 17
        if sum(playerStruct(player).cards(1:5)) < 17 && playerStruct(player).cards(5) ~= 0   %for splits, going to have to make it select the right row
                disp('Dealer has 5 cards without busting.');
                playerStruct(end).win = 2;
        else
            [Deck,playerStruct,selector,movenext,card] = DealCard(Deck,playerStruct,selector,player,1,movenext);
            [~,cardtext] = CardInfo(card);
            fprintf('Dealer dealt: %s %s %s\n',cardtext{:})
        end
    end
    if BestScore(playerStruct,player,1) > 21
        fprintf('Dealer Bust!! Dealer total is %i.\n', BestScore(playerStruct,player,1))
        playerStruct(end).win = -1;
    else
        fprintf('Dealer total is %i\n', BestScore(playerStruct,player,1))
    end
end