function [cardtext1,cardtext2] = ShowCards(playerStruct,player,row)
[~,cardtext1] = CardInfo(playerStruct(player).cards(row,1));
[~,cardtext2] = CardInfo(playerStruct(player).cards(row,2));
end