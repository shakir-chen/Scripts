#!/usr/bin/env python
# encoding: utf-8
# 20min
import pandas as pd

def avg_percentage(game_id, ft_number, team, result):
    """
    :param game_id: (list) The ID of the game.
    :param ft_number: (list) The number of the free throw.
    :param team: (list) Which team took the free throw.
    :param result: (list) The result of the free throw, which is either missed or made.
    :returns: (float) The mean value of the percentages (0.0-100.0) of free throws that
               each team scored in each game.
    """
    df = pd.DataFrame({'id': game_id,
                       'ft': ft_number,
                       'team': team,
                       'result': result
                       })
    # print(df["ft"].sum())
    print(df.sort_values(by="team"))
    print(df.sort_values(by="result"))
    perc = [0, 0]
    for df_ii in range(0, len(df)):
        if df.loc[df_ii]["result"] == "missed":
            perc[0] = perc[0]
        else:       # made
            perc[0] = perc[0] + df.loc[df_ii]["ft"]
        # print(df.loc[df_ii])
    return "I don't know how to calculate the score"


if __name__ == '__main__':
#For example, with the parameters below, the function should return 58.33
    print(avg_percentage(
        [1, 1, 1, 1, 2, 2],
        [1, 2, 3, 4, 1, 2],
        ['home','home','away','home','away','home'],
        ['made','missed','made','missed','missed','made']
    ))
