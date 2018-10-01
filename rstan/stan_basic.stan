data {
  #データYの宣言
  int N;
  real Y[N];
}

parameters {
  #サンプリングしたいパラメータθの宣言
  real mu;
}

model {
  #尤度p(Y|θ)の記述
  #事前分布p(θ)の記述
  for  (n in 1:N) {
      Y[n] ~ normal(mu, 1);
  }
  mu ~ normal(0, 100);
}