--- GLOBALS

G.C.CD = {
    RED = HEX("FF0000"),
    BLACK = HEX("000000"),
    BLUE = HEX("0000FF"),
    GREEN = HEX("00FF00"),
    WHITE = HEX("FFFFFF"),
    TRANSPARENT = HEX("00000000"),
}

-- Hooks

local loc_colour_ref = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        loc_colour_ref()
    end
    G.ARGS.LOC_COLOURS.cd_red = G.C.CD.RED
    G.ARGS.LOC_COLOURS.cd_black = G.C.CD.BLACK
    G.ARGS.LOC_COLOURS.cd_blue = G.C.CD.BLUE
    G.ARGS.LOC_COLOURS.cd_green = G.C.CD.GREEN
    G.ARGS.LOC_COLOURS.cd_white = G.C.CD.WHITE
    G.ARGS.LOC_COLOURS.cd_transparent = G.C.CD.TRANSPARENT
    return loc_colour_ref(_c, _default)
end