function y_hat = prediccion(X, red)
    y_hat = feed_forward(X, red);
    y_hat = y_hat{end};
end