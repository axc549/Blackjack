function CardReadout(playerStruct,player,row)
fprintf('\nScore is %d. Cards are:\n',BestScore(playerStruct,player,row))
for i = 1:length(find(playerStruct(player).cards(row,:)>0))  %for splits, going to have to make it select the right row
    [~,cardtext] = CardInfo(playerStruct(player).cards(row,i));  %for splits, going to have to make it select the right row
    fprintf('%s %s %s.\n',cardtext{:})
end
end