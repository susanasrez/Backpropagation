function gradient = softmax_cross_entropy_derivada(y, y_hat)
    gradient = y_hat - y;
end
