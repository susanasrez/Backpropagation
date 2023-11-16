function cross_entropy = categorical_cross_entropy(y_hat, y)
    epsilon = 1e-10;
    y_hat = max(min(y_hat, 1 - epsilon), epsilon);
    
    cross_entropy = -sum(y .* log(y_hat), 'all');
end
