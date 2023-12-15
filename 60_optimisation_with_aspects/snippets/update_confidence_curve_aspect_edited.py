def update_confidence_model(_target, player, _game, environment):

    sigmoid_initial_confidence = environment['special vals']['sigmoid initial confidence']

    if 'confidence' not in environment:
        environment['confidence'] = dict()
    y = environment['confidence'].get(player, sigmoid_initial_confidence)

    k = 1  # upper asymptote
    a = environment['special vals']['rgr']

    if environment['special vals']['sigmoid type'] == "birch logistic":
        c = 1  # for logistic curve
    elif environment['special vals']['sigmoid type'] == "birch exponential":
        c = 0  # for exponential curve
    elif environment['special vals']['sigmoid type'] == "birch controlled":
        # the curve value set specifically
        c = environment['special vals']['birch c']
    else:
        # birch, but not specified which one
        raise Exception("Birch equation used, but no specific equation requested")

    # Update value of player's confidence using Birch (1999)
    environment['confidence'][player] = y + a * y * (k - y) / (k - y + c * y)

    return environment['confidence'][player]
