function [value,cardtext] = CardInfo(card)
suitList = {'Hearts','Diamonds','Clubs','Spades'};
valueList = {'Ace','2','3','4','5','6','7','8','9','10','Jack','Queen','King'};
if card == 0
    value = 0;
    cardtext = ['not','a','card'];
else
    if mod(card,13) == 0
        value = 13;
    else
        value = mod(card,13);
    end
    valuetype = valueList(value);
    if value > 10
        value = 10;
    end
    suit = ceil(card/13);
    suittype = suitList(suit);
    cardtext = [valuetype,'of',suittype];
end
end