SMODS.Challenge {
    key = "fade_out",
    atlas = "fade_out",
    jokers = {
        { id = 'j_pareidolia', eternal = true, edition = "negative"},
        { id = 'j_sj_shadowjimbo', eternal = true, edition = "negative" },
        { id = 'j_sj_shadowjimbo', eternal = true, edition = "negative" },
        { id = 'j_sj_shadowjimbo', eternal = true, edition = "negative" },
        { id = 'j_sj_shadowjimbo', eternal = true, edition = "negative" }
    },
    restrictions = {
        banned_cards = {
            { id = 'j_marble' },
            { id = 'j_certificate' },
            { id = 'j_dna' },
            { id = 'j_sj_homunculus' },
            { id = 'c_incantation' },
            { id = 'c_grim' },
            { id = 'c_familiar' },
            { id = 'c_cryptid' },
            { id = 'v_magic_trick' },
            { id = 'v_illusion' },
            { id = 'p_standard_normal_1', ids = {
                'p_standard_normal_1', 'p_standard_normal_2',
                'p_standard_normal_3', 'p_standard_normal_4',
                'p_standard_jumbo_1', 'p_standard_jumbo_2',
                'p_standard_mega_1', 'p_standard_mega_2' }
            }
        },
        banned_tags = {
            { id = 'tag_standard' }
        }
    },
    rules = {
        modifiers = {
        { id = 'joker_slots', value = 4 }
        }
    }   
}

SMODS.Challenge {
    key = "legendary_printer",
    atlas = "legendary_printer",
    jokers = {
        { id = 'j_perkeo', edition = 'negative' }
    },
    consumeables = {
        { id = 'c_soul' }
    }
}