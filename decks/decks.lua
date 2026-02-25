SMODS.Atlas({
    key = "metadeck",
    path = "b_meta_deck.png",
    px = 71,
    py = 95
})

SMODS.Back{
    key = "metadeck",
    pos = { x = 0, y = 0},
    atlas = "metadeck",
    unlocked = true,
    discovered = true,
    config = {
        joker1 = "j_sj_callingcard"
        joker2 = "j_sj_shadowjimbo"
    },

apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = #G.deck.cards, 1, -1 do
                    local card = G.deck.cards[i]
                    local id = card:get_id()
                    if id == 11 or id == 12 or id == 13 then
                        card:remove()
                    end
                end

                local card1 = create_card('Joker', G.jokers, nil, nil, nil, nil, self.config.joker1, 'metadeck')
                card1:add_to_deck()
                G.jokers:emplace(card1)

                local card2 = create_card('Joker', G.jokers, nil, nil, nil, nil, self.config.joker2, 'metadeck')
                card2:add_to_deck()
                G.jokers:emplace(card2)

                return true
            end
        }))
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end
}