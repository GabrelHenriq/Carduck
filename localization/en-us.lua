return {
    descriptions = {
        Joker = {
            j_cd_callingcard = {
                name = "Calling Card",
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "for every {C:attention}face{} card",
                    "you {C:red}destroy{}",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
                },
            },
            j_cd_shadowjimbo = {
                name = "Jimbo's Shadow",
                text = {
                    {
                        "After playing a hand, has {C:green}#1# in #2#{} chance",
                        "of destroying a random {C:attention}Face{} card in your hand",
                    }
                },
            },
            j_cd_arcanajoker = {
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
            j_cd_jackpot = {
                name = "Jackpot",
                text = {
                    {
                        "If the hand contains {C:attention}#1#{} or more {C:attention}7{}s,",
                        "Enhance the {C:attention}7{}s to {C:attention}Lucky Cards{}"
                    }
                },
            },
            j_cd_device_friend = {
                name = "DEVICE_FRIEND",
                text = {
                    {
                        "Earns mult equal to {C:attention}#1#x{} the sell value",
                        "of {C:attention}Egg{} Jokers",
                        "{C:inactive}(Currently {C:mult}+#2#{} {C:inactive} Mult)"
                    }
                },
            },
            j_cd_tree = {
                name = "Tree",
                text = {
                    {
                        "Creates a {C:attention}Egg{} Joker on the Start of a {C:attention}Blind{}",
                        "{C:green}#1# in #2#{} of creating a {C:dark_edition}Negative{} {C:attention}Egg{}",
                        "{C:inactive}{s:0.8}There's a man here, he offers you an Egg."
                    }
                },
            },
            j_cd_flushed = {
                name = "Flushed",
                text = {
                    {
                        "If played hand contains a {C:attention}Flush{},",
                        "creates a {C:tarot}''The Lovers''{} card",
                        "{C:inactive}(Must have room)"
                    }
                },
            },
            j_cd_lazy_bones = {
                name = "Lazy Bones",
                text = {
                    {
                        "{C:red}+5{} Mult for every card not scoring in",
                        "played hand",
                    }
                },
            },
            j_cd_papyrus = {
                name = "COOL DUDE!!11!!",
                text = {
                    {
                        "{X:mult,C:white}X#1#{} Mult if all cards",
                        "in played hand {C:attention}score{}"
                    }
                },
            },
            j_cd_minejoker = {
                name = "Miner Joker",
                text = {
                    {
                        "{C:red}Destroys{} played {C:attention}Stone{} cards,",
                        "Gains {X:mult,C:white}X#1#{} Mult for each destroyed",
                        "{C:inactive}(Currently {X:mult,C:white}X#2#{} Mult)",
                    }
                },
            },
            j_cd_encantado = {
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
            j_cd_alok = {
                name = "Alok, The Cat",
                text = {
                    {
                        "{C:attention}SUMMON ASTAROTH{}",
                    }
                },
            },
            j_cd_loyal_joker = {
                name = "Loyal Joker",
                text = {
                    {
                        "If played hand contains a {C:attention}Full House{},",
                        "Played cards earn {C:blue}+#3#{} Chips permanently"
                    }
                },
            },
            j_cd_engineer = {
                name = "Engineer",
                text = {
                    {
                        "Played {C:attention}Steel Cards{}",
                        "give {X:mult,C:white}X#1#{} Mult"
                    }
                },
            },
            j_cd_repetition = {
                name = "Repetition",
                text = {
                    {
                        "Scoring cards in played hand gain {C:red}Red Seal{},",
                        "{C:red}destroys{} {C:attention}3{} cards in hand, then {C:red}destroys{} itself"
                    }
                },
            },
            j_cd_homunculus = {
                name = "The Homunculus",
                text = {
                    {
                        "{C:attention}Recreates{} destroyed Cards",
                        "{C:red}Still triggers destruction effects{}"
                    }
                },
            },
            j_cd_SSS = {
                name = "Rank SSS",
                text = {
                    {
                        "If hand contains a {C:attention}Straight{},",
                        "{C:red}destroys itself{} and gives a {C:dark_edition}Negative Tag{}"
                    }
                },
            },
            j_cd_dealer = {
                name = "Dealer",
                text = {
                    {
                        "{C:blue}+1{} hand, {C:red}+1{} discard and",
                        "{C:attention}+1{} hand size"
                    }
                },
            },
            j_cd_zeroreverse = {
                name = "Zero Reverse",
                text = {
                    {
                        "Prevents Death if chips scored are {C:attention}atleast 50%{}",
                        "of required chips,",
                        "{C:red}destroys itself and other jokers{}, Add {C:attention}5{} random jokers"
                    }
                },
            },
            j_cd_player_sticker = {
                name = "Striker Sticker",
                text = {
                    {
                        "{C:green}Uncommon{} jokers",
                        "give {C:blue}+#1#{} Chips",
                    }
                },
            },
            j_cd_nevermind = {
                name = "Nevermind",
                text = {
                    {
                        "{C:attention}First Discard{} of round {C:red}destroys{} discarded cards",
                        "gains {C:blue}+#1#{} Chips when a card",
                        "is {C:red}destroyed{}",
                        "{C:inactive}(Currently {C:blue}+#2#{} {C:inactive}Chips){}"
                    }
                },
            },
            j_cd_soft_reset = {
                name = "Soft Reset",
                text = {
                    {
                        "{C:red}Destroy scoring cards{} of {C:blue}hand{}",
                        "{C:red}destroys itself{} and creates a {C:attention}Standard Tag{}",
                    }
                },
            },
            j_cd_star_fruit = {
                name = "Star Fruit",
                text = {
                    {
                        "{C:attention}Levels up{} played {C:blue}hand{}",
                        "{C:inactive}({}{C:blue}#1#{} {C:inactive}hands left){}",
                    }
                },
            },
            j_cd_fortune_cookie = {
                name = "Fortune Cookie",
                text = {
                    {
                        "{C:attention}On start of blind{}, {C:green}#1# in #2#{} chance",
                        "to {C:red}destroy itself{} and create {C:attention}2{} {C:tarot}random Tarot{} cards",
                    }
                },
            },
        },
        Back = {
            b_cd_metadeck = {
                name = "Metaverse Deck",
                text = {
                        "Start with {C:red}Calling Card{} and",
                        "{C:blue}Jimbo's Shadow{}.",
                        "{C:attention}No face cards on start{}"
                    },
            },
        },
    },
    misc = {
            challenge_names = {
                c_cd_fade_out = "Desvanecer",
                c_cd_legendary_printer = "Impressora Lendária",
            },
            dictionary = {
                k_cd_zero_reversed = "ZERO_REVERSO: SEM_ENERGIA_SUFICIENTE",
                k_cd_arcana_active = "O Arcano se revela...",
            },
        },
}