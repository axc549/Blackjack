function [playerStruct,numplayers] = MakeBets(playerStruct,numplayers) % add ante as an input
ante = 10;  % make this part of the config
for player = 1:length(playerStruct)-1
    fprintf('\n%s is up. The ante is $%d\n',playerStruct(player).name,ante)
    if playerStruct(player).money(1) >= ante
        choice = ChoiceMenu(playerStruct,player,2,0);
        if choice == 1  
            bet = input(strcat('Bet (',num2str(playerStruct(player).money(1)),' max): '));          
            while bet < ante || bet > playerStruct(player).money(1)
                if bet < ante
                    fprintf('you bet less than the ante ($%d). Bet again.\n',ante)
                else
                    fprintf('%s only has %d. bet again.\n',playerStruct(player).name,playerStruct(player).money(1))
                end
                bet = input('Bet: ');
                    %{ 
                        with UI, need to make it so that there are a couple of
                        options, like $1,5,10 and all in. The #'s may be
                        clicked multiple times to make the bet
                        
                        with UI, need to make it so that the min bet shows
                        up right away
                    %}
            end
            playerStruct(player).money(2) = bet;
            playerStruct(player).money(1) = playerStruct(player).money(1)-bet;
        else 
            playerStruct(player).money(2) = ante;
            playerStruct(player).money(1) = playerStruct(player).money(1)-ante;
        end
    elseif playerStruct(player).money(1) > 0
        fprintf('%s doesn''t have enought to ante up. Leave the table or go all in.\n',playerStruct(player).name)
        choice = ChoiceMenu(playerStruct,player,4,-1);
        if choice == 2
            playerStruct(player).money(2) = playerStruct(player).money(1);
            playerStruct(player).money(1) = 0;
        else
            disp('Are you sure you want to leave?')
            choice = ChoiceMenu(playerStruct,player,4,-1);
            if choice == 2
                disp('going all in.')
                playerStruct(player).money(2) = playerStruct(player).money(1);
                playerStruct(player).money(1) = 0;
            else
                playerStruct = playerStruct([1:(player-1) (player+1):end]);
                numplayers = numplayers - 1;
                % also needs to delete them from / add to the save file????
            end
        end
    else
        fprintf('%s is out of $ and is being evicted from the table.\n',playerStruct(player).name)
        playerStruct = playerStruct([1:(player-1) (player+1):end]);
        numplayers = numplayers - 1;
        % also needs to delete them from / add to the save file????
    end
end
