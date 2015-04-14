function quitgame = QuitGame(playerStruct,numplayers)
disp('Exit Game?')
choice = ChoiceMenu(playerStruct,-1,3,-1);
if choice == 2
    quitgame = 0;
    disp('Would any players like to leave the table?')
    choice = ChoiceMenu(playerStruct,-1,3,-1);
    if choice == 1
        % DO THIS
        disp('under construction')
    end
else
    disp('For Realz?')
    choice = ChoiceMenu(0,0,3,0);
    if choice == 2
        fprintf('\n\nContinuing play')
        quitgame = 0;
    else
        quitgame = 1;
        disp('Would anyone like to save their data?')
        choice = ChoiceMenu(0,0,3,0);
        if choice ~= 2
            for player = 1:numplayers
                fprintf('Does %s want to save their data?\n',playerStruct(player).name)
                choice = ChoiceMenu(0,0,3,0);
                if choice == 1
                    SaveData(playerStruct,player)
                end
            end
        end
    end
end
end

function SaveData(playerStruct,player)
disp('this is under development')
% DO THIS STUFF
end