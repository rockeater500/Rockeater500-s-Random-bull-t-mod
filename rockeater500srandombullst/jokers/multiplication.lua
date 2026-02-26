
SMODS.Joker{ --Multiplication
    key = "multiplication",
    config = {
        extra = {
            filledjokerslots = 0,
            alljokerssellvalue = 1
        }
    },
    loc_txt = {
        ['name'] = 'Multiplication',
        ['text'] = {
            [1] = '{X:mult,C:white}X1{} Mult,',
            [2] = 'increases by 0.1 for every {C:gold}${} in',
            [3] = 'combined sell value of all jokers'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = "rockeater500_rare_math",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rockeater500_rockeater500_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {card.ability.extra.filledjokerslots, card.ability.extra.alljokerssellvalue + ((function() local total = 0; for _, joker in ipairs(G.jokers and (G.jokers and G.jokers.cards or {}) or {}) do total = total + joker.sell_cost end; return total end)()) * 0.1}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
            Xmult = card.ability.extra.alljokerssellvalue + ((function() local total = 0; for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do total = total + joker.sell_cost end; return total end)()) * 0.1
            }
        end
    end
}