from dataclasses import dataclass

@dataclass
class ModelParameters:
    c: float
    curve_inflection_relative_to_numgames: float
    prob_bored: float
    boredom_enabled: bool
    training_data: list
    testing_data: list
    assumed_confidence_plateau: float
    starting_confidence: float
    iteration_base: int
    number_simulated_players: int
    advice: list[tuple[str, str, str|callable]]
    players:list[str]
    args:list[any]
    kwargs:dict[str:any]
    boredom_period: int = 25
    initial_exploration: int = 28

    @property
    def boredom_period(self) -> int:
        '''
        Number of games to play before checking player boredom.
        Attempts to allow every player combo to play each other once on average before checking again.
        '''
        return int(self.number_simulated_players**2)/2

    def active_dataset(self, testing) -> list:
        return self.testing_data if testing else self.training_data

    def iterations(self, testing) -> int:
        '''
        The number of games to play when generating a synthetic dataset
        '''
        if self.boredom_enabled:
            return self.iteration_base
        return int(self.number_simulated_players**2 * len(self.active_dataset(testing)) / 2)

    def rgr(self, testing) -> float:
        '''
        RGR for the parameterised c value, number of games to play, and start/end confidences.
        '''
        if not hasattr(self, '_rgr_cache'):
            self._rgr_cache = dict()
        if self._rgr_cache.get(testing) is None:
            num_games_to_confidence = len(self.active_dataset(testing)) * self.curve_inflection_relative_to_numgames
            self._rgr_cache[testing] = \
                curveutils.rgr_yielding_num_games_for_c(
                    num_games_to_confidence,
                    self.c,
                    start=self.starting_confidence,
                    limit=self.assumed_confidence_plateau)
        return self._rgr_cache[testing]