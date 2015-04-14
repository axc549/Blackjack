function [value1,value2] = TenAndFace (value1,cardtext1,value2,cardtext2)
if value1 == value2 && (strcmp(cardtext1(1),'10') == 1 || strcmp(cardtext2(1),'10') == 1)
    if strcmp(cardtext1(1),'10') == 1
        if strcmp(cardtext2(1),'King') == 1 || strcmp(cardtext2(1),'Jack') == 1 || strcmp(cardtext2(1),'Queen')
            value2 = 11;
        end
    else
        if strcmp(cardtext1(1),'King') == 1 || strcmp(cardtext1(1),'Jack') == 1 || strcmp(cardtext1(1),'Queen')
            value1 = 11;
        end
    end
end
end