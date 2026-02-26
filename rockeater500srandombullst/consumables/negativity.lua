
SMODS.Consumable {
    key = 'negativity',
    set = 'Spectral',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            hand_size0 = 1   
        } 
    },
    loc_txt = {
        name = 'Negativity',
        text = {
            [1] = 'Gives {C:attention}+1{} Hand size'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hand Limit", colour = G.C.BLUE})
                
                G.hand:change_size(1)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}