data {
  int<lower=0> N;
  int<lower=0> Y[N];
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  real<lower=0> lambda;
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  lambda ~ gamma(1, 0.25);
  Y ~ poisson(lambda);
}

