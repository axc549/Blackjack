function playerStruct = WhoWon(playerStruct,numplayers)
if  playerStruct(end).win == 1
    disp('\nDealer has Blackjack.')
    for player = 1:numplayers
        [~,c] = size(playerStruct(player).win);
        for hand = 1:c
            if c == 1
                handname = playerStruct(player).name;
            else
                handname = strcat(playerStruct(player).name,' hand #',num2str(hand));
            end
            if playerStruct(player).win(hand) == 1
                fprintf('\nPush. Both Dealer and %s have Blackjack.\n',handname)
                playerStruct(player).money(1) = playerStruct(player).money(1) + playerStruct(player).money(hand+1);
            else
                fprintf('\n%s loses. Dealer has Blackjack.\n',handname)
            end
        end
    end
else
    dealerscore = BestScore(playerStruct,numplayers+1,1);
    fprintf('\nDealer has %d',dealerscore)
    for player = 1:numplayers
        [~,c] = size(playerStruct(player).win);
        for hand = 1:c
            if c == 1
                handname = playerStruct(player).name;
            else
                handname = strcat(playerStruct(player).name,' hand #',num2str(hand));
            end
            if playerStruct(player).win(hand) == -1
                fprintf('\n%s busted and lost.',handname)
            elseif playerStruct(player).win(hand) == 1
                fprintf('\n%s wins with a Blackjack!',handname)
                playerStruct(player).money(1) = playerStruct(player).money(1) + 3*playerStruct(player).money(hand+1); %have config on payout
            elseif playerStruct(player).win(hand) == 2
                fprintf('\n%s wins -- 5 cards without busting.',handname)
                playerStruct(player).money(1) = playerStruct(player).money(1) + 2*playerStruct(player).money(hand+1);
            else
                if playerStruct(end).win == 2
                    fprintf('\n%s loses. Dealer has 5 cards without busting.',handname)
                elseif playerStruct(end).win == -1
                    fprintf('\nDealer has busted. %s wins.',handname)
                    playerStruct(player).money(1) = playerStruct(player).money(1) + 2*playerStruct(player).money(hand+1);
                else
                    playerscore = BestScore(playerStruct,player,hand);
                    if playerscore < dealerscore
                        fprintf('\n%s loses with %d',handname,playerscore)
                    elseif playerscore > dealerscore
                        fprintf('\n%s wins with %d',handname,playerscore)
                        playerStruct(player).money(1) = playerStruct(player).money(1) + 2*playerStruct(player).money(hand+1);
                    else
                        fprintf('\n%s pushes with %d',handname,playerscore)
                        playerStruct(player).money(1) = playerStruct(player).money(1) + playerStruct(player).money(hand+1);
                    end
                end    
            end
        end
    end
end
fprintf('\n\n')

%{
    TO DO:
    have config on payout
    0 out necessary?
%}
end