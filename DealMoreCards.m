function [playerStruct,numplayers,selector]=DealMoreCards(Deck,playerStruct,numplayers,selector)
for player = 1:numplayers
    [r,~] = size(playerStruct(player).cards);
    for row = 1:r
        movenext = 3; % moves in playerArray to store value
        % whether player is dealt more cards
        if playerStruct(player).win(row) == 1
            choice = 1;
            showscore = 0; %so blackjack isn't shown twice 
        else
            choice = 2; % so player gets a card
            showscore = 1;
            [cardtext1,cardtext2] = ShowCards(playerStruct,player,row);
            if r == 1
                fprintf('\nPlayer #%d is up.\n Cards are: %s %s %s and %s %s %s.\n',player,cardtext1{:}, cardtext2{:})
            else
                if row == 1
                    fprintf('\nPlayer #%d is up. Hand #1 cards are: %s %s %s and %s %s %s.\n',player,cardtext1{:}, cardtext2{:})
                else
                    fprintf('\nPlayer #%d Hand #%d cards are: %s %s %s and %s %s %s.\n',player,row,cardtext1{:}, cardtext2{:})
                end
            end
        end
        % Dealing Further Cards
        while choice ~= 1 && BestScore(playerStruct,player,row) < 22
            % Checks if you won
            if BestScore(playerStruct,player,row) < 22 && playerStruct(player).cards(row,5) ~= 0 
                choice = 0;
                playerStruct(player).win(row) = 2;
                if r == 1
                    disp('5 cards without busting! You win!');
                else
                    fprintf('5 cards without busting! Hand #%d wins!',row);
                end
            else % can do normal play
                choice = ChoiceMenu(playerStruct,player,0,row);
                if choice == 2
                    [Deck,playerStruct,selector,movenext,card] = DealCard(Deck,playerStruct,selector,player,row,movenext);
                    [~,cardtext] = CardInfo(card);
                    fprintf('Dealt: %s %s %s.\n', cardtext{:})
                end
            end
        end
        if BestScore(playerStruct,player,row) < 22 && showscore == 1 
            if r == 1
                fprintf('%s''s total is %i\n',playerStruct(player).name,BestScore(playerStruct,player,row))
            else
                fprintf('%s hand #%d total is %i\n',playerStruct(player).name,row,BestScore(playerStruct,player,row))
            end
        elseif showscore == 1
            fprintf('Bust!! Player %i total is %i\n',player, BestScore(playerStruct,player,row))
            playerStruct(player).win(row) = -1;
        end
    end
end
end