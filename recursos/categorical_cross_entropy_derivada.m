function derivada = categorical_cross_entropy_derivada(y_hat, y)   
    derivada = (y_hat - y) ./ ((1 - y) .* y_hat);
end

