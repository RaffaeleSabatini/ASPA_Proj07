data {
    int<lower=0> N;
    real years[N];
    real avg_temp[N];
}

parameters {
    real a;
    real b;
    real<lower=0> sigma;
}

model {
    vector[N] mu;
    mu = a + b * to_vector(years);

    ## priors
    a ~ normal(10, 5);
    b ~ normal(0, 2);
    sigma ~ uniform(0, 5);

    ## posterior
    avg_temp ~ normal(mu, sigma);
}
