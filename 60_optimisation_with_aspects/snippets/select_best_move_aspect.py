def choose_best_moves(target, ret, *args, **kwargs):
    '''
    Replaces a set of possible moves from base_model.get_moves_from_table with
    the single best move, forcing that to be taken. Args:
        target: base_model.get_moves_from_table ret: the list of best moves to
        be taken at the game's current state *args: args for the function
        **kwargs: keyword args for the function

    Returns: a list containing only the best move of all moves in ret
    '''
    gamedoc = args[0]

    if list(map(str, gamedoc.get('moves', [None, None])[-2:])) == ['skip', 'skip']:
        return ret

    sorted_moves = sorted(ret.items(), key=lambda move: -move[1])
    return {sorted_moves[0][0]: sorted_moves[0][1]}