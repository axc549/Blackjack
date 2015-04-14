function playerStruct = CleanUp(playerStruct,numPlayers)
for player = 1:numPlayers+1
    [r,~] = size(playerStruct(player).cards);
    for hand = 1:r
        playerStruct(player).money = playerStruct(player).money(1);
        playerStruct(player).win = 0;
        playerStruct(player).cards = zeros(1,6);
    end
end
end