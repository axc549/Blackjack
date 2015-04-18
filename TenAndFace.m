function [value1,value2] = TenAndFace (value1,cardtext1,value2,cardtext2)
if value1 == value2 && (strcmp(cardtext1(1:2),'10') == 1 || strcmp(cardtext2(1:2),'10') == 1)
    if strcmp(cardtext1(1:2),'10') == 1
        if strcmp(cardtext2(1:4),'King') == 1 || strcmp(cardtext2(1:4),'Jack') == 1 || strcmp(cardtext2(1:5),'Queen')
            value2 = 11;
        end
    else
        if strcmp(cardtext1(1:4),'King') == 1 || strcmp(cardtext1(1:4),'Jack') == 1 || strcmp(cardtext1(1:5),'Queen')
            value1 = 11;
        end
    end
end
end