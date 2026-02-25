return {
    descriptions = {
        Joker = {
            j_sj_callingcard = {
                name = "Calling Card",
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "for every {C:attention}face{} card",
                    "you {C:red}destroy{}",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
                },
            },
            j_sj_shadowjimbo = {
                name = "Jimbo's Shadow",
                text = {
                    {
                        "After playing a hand, has {C:green}#1# in #2#{} chance",
                        "of destroying a random {C:attention}Face{} card in your hand",
                    }
                },
            },
            j_sj_arcanajoker = {
                name = "Arcana Joker",
                text = {
                    {
                        "Whenever you use a {C:tarot}Tarot{} card,",
                        "has a {C:green}#1# in #2#{} chance",
                        "to create a random {C:tarot}Tarot{} card.",
                        "{C:inactive}(Must have room)"
                    }
                },
            },
            j_sj_jackpot = {
                name = "Jackpot",
                text = {
                    {
                        "If the hand contains {C:attention}#1#{} or more {C:attention}7{}s,",
                        "Enhance the {C:attention}7{}s to {C:attention}Lucky Cards{}"
                    }
                },
            },
            j_sj_device_friend = {
                name = "DEVICE_FRIEND",
                text = {
                    {
                        "Earns mult equal to {C:attention}#1#x{} the sell value",
                        "of {C:attention}Egg{} Jokers",
                        "{C:inactive}(Currently {C:mult}+#2#{} {C:inactive} Mult)"
                    }
                },
            },
            j_sj_tree = {
                name = "Tree",
                text = {
                    {
                        "Creates a {C:attention}Egg{} Joker on the Start of a {C:attention}Blind{}",
                        "{C:green}#1# in #2#{} of creating a {C:dark_edition}Negative{} {C:attention}Egg{}",
                        "{C:inactive}{s:0.8}There's a man here, he offers you an Egg."
                    }
                },
            },
            j_sj_flushed = {
                name = "Flushed",
                text = {
                    {
                        "If played hand contains a {C:attention}Flush{},",
                        "creates a {C:tarot}''The Lovers''{} card",
                        "{C:inactive}(Must have room)"
                    }
                },
            },
            j_sj_lazy_bones = {
                name = "lazy Bones",
                text = {
                    {
                        "{C:red}+5{} Mult for every card not scoring in",
                        "played hand",
                    }
                },
            },
            j_sj_papyrus = {
                name = "COOL DUDE!!11!!",
                text = {
                    {
                        "{X:mult,C:white}X#1#{} Mult if all cards",
                        "in played hand {C:attention}scored{}"
                    }
                },
            },
            j_sj_minejoker = {
                name = "Miner Joker",
                text = {
                    {
                        "{C:red}Destroys{} played {C:attention}Stone{} cards,",
                        "Gains {X:mult,C:white}X#1#{} Mult for each destroyed",
                        "{C:inactive}(Currently {X:mult,C:white}X#2#{} Mult)",
                    }
                },
            },
            j_sj_encantado = {
                name = "Enchanted",
                text = {
                    {
                        "This Joker gains",
                        "{C:mult}+#1#{} Mult per", 
                        "{C:attention}enhanced{} card played",
                        "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)",
                    }
                },
            },
            j_sj_alok = {
                name = "Alok, The Cat",
                text = {
                    {
                        "{C:attention}SUMMON ASTAROTH{}",
                    }
                },
            },
        }
    },
    misc = {

            -- do note that when using messages such as: 
            -- message = localize{type='variable',key='a_xmult',vars={current_xmult}},
            -- that the key 'a_xmult' will use provided values from vars={} in that order to replace #1#, #2# etc... in the localization file.


        dictionary = {
            a_chips="+#1#",
            a_chips_minus="-#1#",
            a_hands="+#1# Hands",
            a_handsize="+#1# Hand Size",
            a_handsize_minus="-#1# Hand Size",
            a_mult="+#1# Mult",
            a_mult_minus="-#1# Mult",
            a_remaining="#1# Remaining",
            a_sold_tally="#1#/#2# Sold",
            a_xmult="X#1# Mult",
            a_xmult_minus="-X#1# Mult",
        }
    }
}