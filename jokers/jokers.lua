
-- you can have shared helper functions
function shakecard(self) --visually shake a card
    G.E_MANAGER:add_event(Event({
        func = function()
            self:juice_up(0.5, 0.5)
            return true
        end
    }))
end

function return_JokerValues() -- not used, just here to demonstrate how you could return values from a joker
    if context.joker_main and context.cardarea == G.jokers then
        return {
            chips = card.ability.extra.chips,       -- these are the 3 possible scoring effects any joker can return.
            mult = card.ability.extra.mult,         -- adds mult (+)
            x_mult = card.ability.extra.x_mult,     -- multiplies existing mult (*)
            card = self,                            -- under which card to show the message
            colour = G.C.CHIPS,                     -- colour of the message, Balatro has some predefined colours, (Balatro/globals.lua)
            message = localize('k_upgrade_ex'),     -- this is the message that will be shown under the card when it triggers.
            extra = { focus = self, message = localize('k_upgrade_ex') }, -- another way to show messages, not sure what's the difference.
        }
    end
end

SMODS.Atlas({
    key = "callingcard",
    path = "j_callingcard.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "shadowjimbo",
    path = "j_shadowjimbo.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "arcanajoker",
    path = "j_arcanajoker.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "jackpot",
    path = "j_jackpot.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "device_friend",
    path = "j_devicefriend.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "tree",
    path = "j_tree.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "flushed",
    path = "j_flushed.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "lazy_bones",
    path = "j_lazybones.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "papyrus",
    path = "j_papyrus.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "minejoker",
    path = "j_minejoker.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "encantado",
    path = "j_sample_multieffect.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "loyal_joker",
    path = "j_loyal.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "alok",
    path = "j_alok.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "engineer",
    path = "j_engineer.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "repetition",
    path = "j_repetition.png",
    px = 71,
    py = 95
})

SMODS.Sound({
    key = "p5critical",
    path = "p5critical.ogg"
})

SMODS.Sound({
    key = "barkdog",
    path = "barkdog.ogg"
})

SMODS.Joker{
    key = "callingcard",                                  --name used by the joker.    
    config = { extra = { x_mult = 1, gain = 0.5} },    --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                              --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 2,                                          --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 6,                                            --cost to buy the joker in shops.
    blueprint_compat=true,                               --does joker work with blueprint.
    eternal_compat=true,                                 --can joker be eternal.
    unlocked = true,                                     --is joker unlocked by default.
    discovered = true,                                   --is joker discovered by default.    
    effect=nil,                                          --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                        --pos of a soul sprite.
    atlas = 'callingcard',                                --atlas name, single sprites are deprecated.

calculate = function(self, card, context)
        -- destroy
        if context.remove_playing_cards and not context.blueprint then
            local face_cards_destroyed = 0
            for k, val in ipairs(context.removed) do
                if val:is_face() then 
                    face_cards_destroyed = face_cards_destroyed + 1
                end
            end

            if face_cards_destroyed > 0 then
                card.ability.extra.x_mult = card.ability.extra.x_mult + (card.ability.extra.gain * face_cards_destroyed)
                
                

                return {
                    play_sound('sj_p5critical', 1, 0.5),
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    card = card
                }
            end
        end

        -- glass
        if context.cards_destroyed and not context.blueprint then
            local face_cards_shattered = 0
            for k, val in ipairs(context.glass_shattered) do
                if val:is_face() then
                    face_cards_shattered = face_cards_shattered + 1
                end
            end

            if face_cards_shattered > 0 then
                card.ability.extra.x_mult = card.ability.extra.x_mult + (card.ability.extra.gain * face_cards_shattered)
                
                -- sound
                play_sound('sj_p5critical', 1, 0.5)

                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    card = card
                }
            end
        end

        -- mult
        if context.joker_main and card.ability.extra.x_mult > 1 then
            return {
                x_mult = card.ability.extra.x_mult,
                colour = G.C.MULT
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gain, card.ability.extra.x_mult } }
    end
}

SMODS.Joker{
    key = "shadowjimbo",
    config = { extra = { odds = 2 } },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'shadowjimbo',
    soul_pos = nil,

calculate = function(self, card, context)
        if context.after and not context.blueprint then
            if pseudorandom('shadowjimbo') < G.GAME.probabilities.normal / card.ability.extra.odds then
                local face_cards_in_hand = {}
                for i = 1, #G.hand.cards do
                    if G.hand.cards[i]:is_face() then
                        table.insert(face_cards_in_hand, G.hand.cards[i])
                    end
                end

                if #face_cards_in_hand > 0 then
                    local card_to_destroy = pseudorandom_element(face_cards_in_hand, pseudoseed('shadowjimbo_dest'))
                    
                    card_to_destroy:start_dissolve()
                    
                    SMODS.calculate_context({remove_playing_cards = true, removed = {card_to_destroy}})
                    
                    return {
                        card = card,
                        message = "The true self.",
                        colour = G.C.RED
                    }
                end
            end
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end
}

SMODS.Joker{
    key = "arcanajoker",
    config = { extra = { odds = 3 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 12,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'arcanajoker',

calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint then
            if context.consumeable.ability.set == 'Tarot' then
                
                if pseudorandom('arcanajoker') < G.GAME.probabilities.normal / card.ability.extra.odds then
                    
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                local new_card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'arc')
                                new_card:add_to_deck()
                                G.consumeables:emplace(new_card)
                                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
                                return true
                            end
                        }))

                        return {
                            message = "The Arcana!",
                            colour = G.C.PURPLE,
                            card = card
                        }
                    else
                        return {
                            message = "...",
                            colour = G.C.UI.TEXT_INACTIVE
                        }
                    end
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end        
}

SMODS.Joker{
    key = "jackpot",
    config = { extra = { num_sevens = 3 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'jackpot',
    soul_pos = nil,

calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local sevens = {}
            for i = 1, #context.full_hand do
                if context.full_hand[i]:get_id() == 7 then
                    table.insert(sevens, context.full_hand[i])
                end
            end

            if #sevens >= card.ability.extra.num_sevens then
                for i = 1, #sevens do
                    sevens[i]:set_ability(G.P_CENTERS.m_lucky, nil, true)
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            sevens[i]:juice_up()
                            return true
                        end
                    }))
                end

                return {
                    message = "Jackpot!",
                    colour = G.C.MONEY,
                    card = card
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.num_sevens } }
    end
}

SMODS.Joker{
    key = "device_friend",
    config={ extra = { mult_mod = 3} },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'device_friend',
    soul_pos = nil,

calculate = function(self, card, context)
        if context.joker_main then
            local total_egg_value = 0
            
            for i = 1, #G.jokers.cards do
                local other_joker = G.jokers.cards[i]
                if other_joker.config.center.key == 'j_egg' then
                    total_egg_value = total_egg_value + other_joker.sell_cost
                end
            end

            if total_egg_value > 0 then
                return {
                    mult = total_egg_value * card.ability.extra.mult_mod,
                    card = card
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local current_total_mult = 0
        
        if G.jokers then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].config.center.key == 'j_egg' then
                    current_total_mult = current_total_mult + (G.jokers.cards[i].sell_cost * card.ability.extra.mult_mod)
                end
            end
        end

        return { vars = { card.ability.extra.mult_mod, current_total_mult } }
    end
}

SMODS.Joker{
    key = "tree",
    config = { extra = { odds = 7 }}, -- d_size  = discard size, h_size = hand size. (HOWEVER, you can't have both on 1 joker!)
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 7,
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'tree',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            
            local is_negative = false
            if pseudorandom('tree_negative') < G.GAME.probabilities.normal / card.ability.extra.odds then
                is_negative = true
            end


            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit or is_negative then
                

                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()

                        local new_card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_egg', 'tree')
                        new_card:add_to_deck()
                        

                        if is_negative then
                            new_card:set_edition('e_negative', true)
                        end
                        
                        G.jokers:emplace(new_card)
                        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                        return true
                    end
                }))

                return {
                    message = is_negative and ".ggE" or "Egg.",
                    colour = G.C.BLUE,
                    card = card
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end
}

SMODS.Joker{
    key = "flushed",
    config={ extra = {poker_hand = 'Flush'} },
    loc_vars = function(self, info_queue, card)
        return { vars = { localize(card.ability.extra.poker_hand, 'poker_hands') } }
    end,
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'flushed',

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands["Flush"]) and
            #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card { key = "c_lovers" }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return { message = localize('k_plus_tarot'),
                colour = G.C.SECONDARY_SET.Tarot
                }
            end
    end
}

SMODS.Joker{
    key = "lazy_bones",
    config = { extra = { mult = 5 } },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'lazy_bones',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.joker_main then
            local non_scoring_count = 0

            for _, played_card in ipairs(context.full_hand) do
                local is_scoring = false
                for _, scoring_card in ipairs(context.scoring_hand) do
                    if played_card == scoring_card then
                        is_scoring = true
                        break
                    end
                end
                
                if not is_scoring then
                    non_scoring_count = non_scoring_count + 1
                end
            end

            if non_scoring_count > 0 then
                return {
                    mult = non_scoring_count * card.ability.extra.mult,
                    card = card
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end
}

SMODS.Joker{
    key = "papyrus",
    config = { extra = { x_mult = 2 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'papyrus',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.joker_main then

            if #context.full_hand == #context.scoring_hand then
                return {
                    x_mult = card.ability.extra.x_mult,
                    colour = G.C.MULT,
                    card = card
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult } }
    end
}

SMODS.Joker{
    key = "minejoker",
    config = { extra = { x_mult = 1, gain = 0.25 } }, 
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'minejoker',

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.x_mult > 1 then
            return {
                x_mult = card.ability.extra.x_mult,
                colour = G.C.MULT
            }
        end

        if context.after and not context.blueprint then
            local stones_found = false
            
            for i = 1, #context.scoring_hand do
                local target = context.scoring_hand[i]
                if target.config.center == G.P_CENTERS.m_stone and not target.removed then
                    stones_found = true
                    
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.2,
                        func = function() 
                            target:start_dissolve()
                            return true
                        end
                    }))
                    
                    card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.gain
                end
            end

            if stones_found then
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    card = card
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gain, card.ability.extra.x_mult } }
    end
}

SMODS.Joker{
    key = "encantado",
    config = { extra = { mult_gain = 1, mult = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } } 
    end,
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'encantado',
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local enhanced = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                if next(SMODS.get_enhancements(scored_card)) and not scored_card.debuff then
                    enhanced[#enhanced + 1] = scored_card
                end
            end
            if #enhanced > 0 then 
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain * #enhanced
                return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                    colour = G.C.MULT
                    }
                end
            end
        if context.joker_main then 
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Joker{
    key = "loyal_joker",
    config = { extra = { poker_hand = 'Full House', chips = 15 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.poker_hand, 'poker_hands', card.ability.extra.chips } }
    end,
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = "loyal_joker",
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.poker_hands and next(context.poker_hands["Full House"]) then
                
                local random_pitch = 0.8 + math.random() * 0.4

                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('sj_barkdog', random_pitch, 0.6)
                        return true
                    end
                }))
                
                context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + card.ability.extra.chips
                
                return {
                    extra = { focus = context.other_card, message = localize('k_upgrade_ex'), colour = G.C.CHIPS },
                    card = card
                }
            end
        end
    end
}

SMODS.Joker{
    key = "alok",
    rarity = 4,
    cost = 10,
    unlocked = true,
    discovered = true,
    atlas = 'alok',
}

SMODS.Joker{
    key = "engineer",
    config = { extra = { steel_xmult = 1.5 } }, 
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'engineer',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.config.center == G.P_CENTERS.m_steel then
                return {
                x_mult = card.ability.extra.steel_xmult,
                card = card
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.steel_xmult } }
    end
}

SMODS.Joker{
    key = "repetition",
    config = { extra = { cards_to_destroy = 3 } }, 
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 9,
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'repetition',

    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            -- 1. Aplicação de Selo (Voltando ao método seguro mas funcional)
            if context.scoring_hand then
                for i = 1, #context.scoring_hand do
                    local sc = context.scoring_hand[i]
                    if sc and not sc.removed then
                        -- O segredo é NÃO usar o terceiro argumento (immediate) como true
                        sc:set_seal('Red', nil, true) 
                    end
                end
            end

            -- 2. Destruição de cartas e Sinergia com Calling Card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.5,
                func = function()
                    local destroyed_cards = {}
                    local count = 0
                    if G.hand and G.hand.cards then
                        for i = #G.hand.cards, 1, -1 do
                            local c = G.hand.cards[i]
                            if count < card.ability.extra.cards_to_destroy and c and not c.removed then
                                table.insert(destroyed_cards, c)
                                c:start_dissolve()
                                count = count + 1
                            end
                        end
                    end
                    
                    -- FORÇAR o Calling Card a ver a destruição
                    if #destroyed_cards > 0 then
                        SMODS.calculate_context({remove_playing_cards = true, removed = destroyed_cards})
                    end
                    return true
                end
            }))

            -- 3. Auto-destruição
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function()
                    card:start_dissolve()
                    return true
                end
            }))
        end
    end
}