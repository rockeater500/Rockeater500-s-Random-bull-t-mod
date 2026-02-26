
SMODS.Joker{ --Division
    key = "division",
    config = {
        extra = {
            destructiontimer = 0,
            repetitions = 1,
            hand_size0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Division',
        ['text'] = {
            [1] = 'Gives {C:attention}+1{} joker slot for every King played.',
            [2] = 'Self destructs in 5 rounds'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = "rockeater500_legendary_math",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rockeater500_rockeater500_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.destructiontimer}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                for i = 1, card.ability.extra.repetitions do
                    SMODS.calculate_effect({
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hand Limit", colour = G.C.BLUE})
                            
                            G.hand:change_size(1)
                            return true
                        end}, card)
                    end
                end
            end
            if context.setting_blind  then
                return {
                    func = function()
                        card.ability.extra.destructiontimer = (card.ability.extra.destructiontimer) + 1
                        return true
                    end
                }
            end
            if context.starting_shop  then
                if to_big((card.ability.extra.destructiontimer or 0)) >= to_big(5) then
                    return {
                        func = function()
                            local target_joker = card
                            
                            if target_joker then
                                target_joker.getting_sliced = true
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        target_joker:shatter({G.C.RED}, nil, 1.6)
                                        return true
                                    end
                                }))
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                            end
                            return true
                        end
                    }
                end
            end
        end
    }