function [playerStruct,selector]=Split(Deck,playerStruct,numplayers,selector)
% this function checks whether player can split or not and does the split
for player = 1:numplayers
    row = 1;
    [r,~] = size(playerStruct(player).cards);
    [value1,cardtext1] = CardInfo(playerStruct(player).cards(row,1));
    [value2,cardtext2] = CardInfo(playerStruct(player).cards(row,2));
    while row <= r
        %so 10 and face can't split
        [value1,value2] = TenAndFace(value1,cardtext1,value2,cardtext2);
        % whether player can split
        if value1 ~= value2
            row = row+1;
        else % this is if cards can split
            % checks if enough $
            if playerStruct(player).money(1) < playerStruct(player).money(1)
                fprintf('%s does not have enough $ to split',playerStruct(player).name)
                if row == 1
                    fprintf('.\n')
                else
                    fprintf(' again.\n')
                end
                row = row+1;
            else
                fprintf('\n%s is up\n',playerStruct(player).name)
                fprintf('Now looking at hand #%d: the %s %s %s and the %s %s %s.\n',row,cardtext1{:},cardtext2{:})
                % asks if wants to split
                choice = ChoiceMenu(playerStruct,player,1);
                if choice == 1
                    [r,c] = size(playerStruct(player).cards);
                    % makes new row in playerStruct.cards
                    newRow = zeros(1,c);
                    playerStruct(player).cards = [playerStruct(player).cards;newRow];
                    % finds cards 1 & 2
                    card1 = playerStruct(player).cards(row,1);
                    [value1,cardtext1] = CardInfo(card1);
                    card2 = playerStruct(player).cards(row,2);
                    [value2,cardtext2] = CardInfo(card2);
                    % moves cards to new positions
                    playerStruct(player).cards(r+1,1) = card2;
                    playerStruct(player).cards(row,2) = 0;
                    % deal 2 new cards
                    [Deck,playerStruct,selector,~,card3] = DealCard(Deck,playerStruct,selector,player,row,2);
                    [~,cardtext3] = CardInfo(card3);
                    [Deck,playerStruct,selector,~,card4] = DealCard(Deck,playerStruct,selector,player,r+1,2); 
                    [~,cardtext4] = CardInfo(card4);
                    fprintf('Dealt a %s %s %s to the %s %s %s and a %s %s %s to the %s %s %s\n',cardtext3{:},cardtext1{:},cardtext4{:},cardtext2{:})
                    %Expand player.win and player.money
                    playerStruct(player).win = [playerStruct(player).win 0];
                    playerStruct(player).money = [playerStruct(player).money playerStruct(player).money(2)];
                elseif choice == 2
                    row = row+1;
                end
            end
        end
        % Loop Conditions
        [r,~] = size(playerStruct(player).cards);
        if row <= r
            card1 = playerStruct(player).cards(row,1);
            [value1,cardtext1] = CardInfo(card1);
            card2 = playerStruct(player).cards(row,2);
            [value2,cardtext2] = CardInfo(card2);
            % so ten and face can't split
            [value1,value2] = TenAndFace (value1,cardtext1,value2,cardtext2);
            if BestScore(playerStruct,player,row) == 21
                % blackjack counter
                playerStruct(player).win(row) = 1;
                if r == 1
                    handname = playerStruct(player).name;
                else
                    handname = strcat(playerStruct(player).name,' hand #',row);
                end
                fprintf('%s has Blackjack!',handname)
            end
        end
    end
end
end  