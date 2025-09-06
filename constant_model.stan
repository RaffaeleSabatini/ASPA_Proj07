data {
    int<lower=0> N;
    real avg_temp[N];
}

parameters {
    real k;
    real<lower=0> sigma;
}

model {
    ## priors
    k ~ normal(10, 5);
    sigma ~ uniform(0, 1);

    ## posterior
    avg_temp ~ normal(k, sigma);
}
