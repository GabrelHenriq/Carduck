
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
    key = "teste_flush",
    path = "j_sample_money.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sample_roomba",
    path = "j_sample_roomba.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sample_drunk_juggler",
    path = "j_sample_drunk_juggler.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sample_hackerman",
    path = "j_sample_hackerman.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sample_baroness",
    path = "j_sample_baroness.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sample_rarebaseballcard",
    path = "j_sample_rarebaseballcard.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sample_multieffect",
    path = "j_sample_multieffect.png",
    px = 71,
    py = 95
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
        -- Caso 1: Cartas sendo destruídas (Tarô, Trading Card, etc.)
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
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    card = card
                }
            end
        end

        -- Caso 2: Cartas de Vidro quebrando durante a pontuação
        if context.cards_destroyed and not context.blueprint then
            local face_cards_shattered = 0
            for k, val in ipairs(context.glass_shattered) do
                if val:is_face() then
                    face_cards_shattered = face_cards_shattered + 1
                end
            end

            if face_cards_shattered > 0 then
                card.ability.extra.x_mult = card.ability.extra.x_mult + (card.ability.extra.gain * face_cards_shattered)
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    card = card
                }
            end
        end

        -- Caso 3: Aplicar o multiplicador na pontuação
        if context.joker_main and card.ability.extra.x_mult > 1 then
            return {
                x_mult = card.ability.extra.x_mult,
                colour = G.C.MULT
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
    -- O primeiro valor (#1#) é o ganho (0.5)
    -- O segundo valor (#2#) é o XMult atual do cartão
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
                    
                    -- 1. Destruição Visual
                    card_to_destroy:start_dissolve()
                    
                    -- 2. O PULO DO GATO: Avisa outros Coringas (como o Calling Card)
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
        -- Gatilho de uso de consumível
        if context.using_consumeable and not context.blueprint then
            -- Verifica se é um Tarô
            if context.consumeable.ability.set == 'Tarot' then
                
                -- CÁLCULO DE SORTE: 1 em (odds)
                -- Usamos G.GAME.probabilities.normal para que funcione com o Coringa 'Oops! All 6s'
                if pseudorandom('arcanajoker') < G.GAME.probabilities.normal / card.ability.extra.odds then
                    
                    -- Verifica se há espaço no inventário
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        
                        -- Reserva espaço
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

    -- loc_vars para mostrar o número dinamicamente na descrição
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end        
}

SMODS.Joker{
    key = "teste_flush",
    config={ extra = {poker_hand = 'Flush'} },
    loc_vars = function(self, info_queue, card)
        return { vars = { localize(card.ability.extra.poker_hand, 'poker_hands') } }
    end,
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'teste_flush',

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
    key = "sample_roomba",
    config={ },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'sample_roomba',
    soul_pos = nil,

        calculate = function(self, card, context)
        if context.end_of_round and not (context.individual or context.repetition) then
            local cleanable_jokers = {}

            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= self then -- if joker is not itself 
                    cleanable_jokers[#cleanable_jokers+1] = G.jokers.cards[i] -- add all other jokers into a array
                end
            end

            local joker_to_clean = #cleanable_jokers > 0 and pseudorandom_element(cleanable_jokers, pseudoseed('clean')) or nil -- pick a random valid joker, or null if no valid jokers

            if joker_to_clean then -- if we have a valid joker we can bump into
                shakecard(joker_to_clean) -- simulate bumping into a card
                if(joker_to_clean.edition) then --if joker has an edition
                    if not joker_to_clean.edition.negative then --if joker is not negative
                        joker_to_clean:set_edition(nil) -- clean the joker from it's edition
                    end
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { }
    end
}

SMODS.Joker{
    key = "sample_drunk_juggler",
    config = { d_size = 1 }, -- d_size  = discard size, h_size = hand size. (HOWEVER, you can't have both on 1 joker!)
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'sample_drunk_juggler',
    soul_pos = nil,

    calculate = function(self, card, context)
        return nil
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.d_size, localize{type = 'name_text', key = 'tag_double', set = 'Tag'} } }
    end
}

SMODS.Joker{
    key = "sample_hackerman",
    config = { repetitions = 1 },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'sample_hackerman',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and (
            context.other_card:get_id() == 6 or 
            context.other_card:get_id() == 7 or 
            context.other_card:get_id() == 8 or 
            context.other_card:get_id() == 9) then
            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.repetitions,
                card = self
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { }
    end
}

SMODS.Joker{
    key = "sample_baroness",
    config = { extra = { x_mult = 1.5 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'sample_baroness',
    soul_pos = nil,

    calculate = function(self, card, context)
        if not context.end_of_round then
            if context.cardarea == G.hand and context.individual and context.other_card:get_id() == 12 then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED,
                        card = self,
                    }
                else
                    return {
                        x_mult = card.ability.extra.x_mult,
                        card = self
                    }
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult } }
    end
}

SMODS.Joker{
    key = "sample_rarebaseballcard",
    config = { extra = { x_mult = 2 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'sample_rarebaseballcard',
    soul_pos = nil,

    calculate = function(self, card, context)
        if not (context.individual or context.repetition) and context.other_joker and context.other_joker.config.center.rarity == 3 and self ~= context.other_joker then
            shakecard(context.other_joker)
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                colour = G.C.RED,
                x_mult = card.ability.extra.x_mult
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult }, key = self.key}
    end
}

SMODS.Joker{
    key = "sample_multieffect",
    config = { extra = { chips = 10, mult = 10, x_mult = 2 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'sample_multieffect',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 10 then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
                x_mult = card.ability.extra.x_mult,
                card = self
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult }, key = self.key }
    end
}