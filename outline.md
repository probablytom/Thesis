# Thesis outline

Current intended outline (by chapter, with contributions for each):

1. Introduction
2. Lit Review
    - Exactly what you'd expect
3. Motivations for work
    - What directions do we want to take given what we've seen in the literature?
    - Lay out some interesting angles; pose research questions
4. Case study 1: RPGLite
    - Doesn't have to be long but necessary background.
    - Introduces the game itself, the data collected, the general model of play
5. Model fitting
    - Illustrate use of aspects for introducing different player-specific models
    - Describe basic confidence curve
    - Introduce previous-distribution model
    - Introduce hyperbolic decay model
    - RQ: Can we fit model details per-player to get realistic player behaviour?
    - RQ: Can we cluster based on accuracy of different models for each player?
6. Models for predicting future behaviour
    - RQ: Can we generate predictive data for unseen models?
    - Introduce season 2 changes
    - Demonstrate predicting S2 data using S1 fittings
7. Architectural implications of modelling with AOP (tentative)
    - this chapter is a kind of philosophy-of-modelling chapter. We discussed potentially putting it at the end because it's the hardest of our ideas to thoroughly defend. I like it though and everything else is, frankly, a little thin on the ground, so I think this beefs it up nicely and defends the idea writ large
    - contributions are [discursive] observations about the impact of AOP on modelling
        - Experiments become aspect applications
        - separation of experiment into expected-behaviour and changes-to-status-quo makes experimental structure of the model explicit
        - this also allows for easier building on people's ideas and collaborating around a common base model
        - AOP which can alter process, like pdsf can, gives AOP complete freedom in making arbitrary model changes
        - Allows for better maintainability of model code: experimental concept and underlying theory are separated, making improvements to the representation of the world easier (and alterations to experiments, too)
        - Allows for the rapid development of multiple experiments at once, as aspects can be applied in a variety of combinations and tested without needing to edit source (we can test the efficacy of each combination of separated behaviours individually, so we get the potential for 2^n experiments out of n aspect-separated alterations)
8. Conclusion/Discussion
    - Maybe the real aspects were the friends we made along the way.
