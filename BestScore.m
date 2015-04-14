function score = BestScore(playerStruct,player,row)
[~,c] = size(playerStruct(player).cards);
score = 0;
acecount = 0;
for i = 1:c
    [value,~] = CardInfo(playerStruct(player).cards(row,i));
    score = score + value;
    if value == 1
        acecount = acecount + 1;
    end
end
for i = 1:acecount
    if score + 10 <= 21
        score = score + 10;
    end
end
% playerStruct(player).score = score;
    % or could make each win cell a 1x2 array with second value as the score
end
