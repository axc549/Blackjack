function choice = ChoiceMenu(playerStruct,player,menuselect,row)
choiceMenu = {'stay','hit','view','split','don''t split','bet','ante up', 'view $','yes','no','leave','all in'};
if menuselect == 0
    menuChoice = choiceMenu(1:3);
elseif menuselect == 1
    menuChoice = choiceMenu(4:5);
elseif menuselect == 2
    menuChoice = choiceMenu(6:8);
elseif menuselect == 3
    menuChoice = choiceMenu(9:10);
elseif menuselect == 4
    menuChoice = choiceMenu(11:12);
end
choice = -1;
while choice ~= 1 && choice ~= 2
[~,c] = size(menuChoice);
numbers = 1:c;
fullArray = [num2cell(numbers);menuChoice];
fprintf('%d. %s     ',fullArray{:})
fprintf('\n')
choice = input('Enter your choice: ');
if choice == 3 && menuselect == 0
    CardReadout(playerStruct,player,row)
    menuChoice = choiceMenu(1:2);
elseif choice == 3 && menuselect == 2
    fprintf('%s has $%d\n',playerStruct(player).name,playerStruct(player).money(1))
    menuChoice = choiceMenu(6:7);
elseif choice > size(menuChoice)
    disp('Enter a valid choice')
end
end
end