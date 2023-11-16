function probabilities = softmax(z)
    % z: logits (salidas lineales)

    probabilities = exp(z) ./ sum(exp(z), 2);
end
