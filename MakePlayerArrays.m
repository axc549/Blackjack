function [playerStruct,numplayers] = MakePlayerArrays()
% Creates Players and Associated Arrays
numplayers = input('Input # of Players: ');
% Checks if numplayers input correctly
while numplayers <= 0 || numplayers > 8
    numplayers = input('Input # of Players (1-8): ');
end

% creates number of players
numberMenu = {'1','2','3','4','5','6','7','8'};
numbers = numberMenu(1:numplayers);
name = repmat({'Player '},1,numplayers);    
playerNames = [strcat(name,numbers) {'Dealer'}]; %make it so that players can edit their names
money = zeros(numplayers+1,1)+50; % decide how much everyone starts with.
win = zeros(numplayers+1,1);
cards = zeros(numplayers+1,6);
playerTable = table(playerNames',money,win,cards,'VariableNames',{'name' 'money' 'win','cards'});
playerStruct = table2struct(playerTable)';
end