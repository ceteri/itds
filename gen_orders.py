#!/usr/bin/env python
# encoding: utf-8

import random
import sys
import uuid


debug = False # True

CUSTOMER_SEGMENTS = (
    [0.2, ["0", random.gauss, 0.25, 0.75, "%0.2f"]],
    [0.7, ["1", random.gauss, 0.6, 0.2, "%0.2f"]],
    [0.8, ["0", random.gauss, 1.5, 0.25, "%0.2f"]],
    [1.0, ["1", random.gauss, 0.75, 0.2, "%0.2f"]]
)

def gen_row (segments, num_col):
    coin_flip = random.random()

    for prob, rand_var in segments:
        if debug:
            print coin_flip, prob

        if coin_flip <= prob:
            (fraud, dist, mean, sigma, format) = rand_var
            order_id = str(uuid.uuid1()).split("-")[0]
            return [fraud] + [order_id] + map(lambda x: format % dist(mean, sigma), range(0, num_col))


if __name__ == '__main__':
    num_row = int(sys.argv[1])
    num_col = int(sys.argv[2])

    print "\t".join(["fraud"] + ["order_id"] + map(lambda x: "v" + str(x), range(0, num_col)))

    for i in range(0, num_row):
        print "\t".join(gen_row(CUSTOMER_SEGMENTS, num_col))
