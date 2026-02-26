SMODS.Rarity {
    key = "math",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.035,
    badge_colour = HEX('829bb8'),
    loc_txt = {
        name = "Math"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "rare_math",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.02,
    badge_colour = HEX('0558b6'),
    loc_txt = {
        name = "Rare Math"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "legendary_math",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.01,
    badge_colour = HEX('59b2aa'),
    loc_txt = {
        name = "Legendary math"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}