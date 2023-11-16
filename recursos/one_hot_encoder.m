function encoded = one_hot_encoder(variable_categorica)
    unique_val = unique(variable_categorica);
    n_clases = length(unique_val);

    encoded = zeros(length(variable_categorica), n_clases);
    
    for i = 1:n_clases
        encoded(:, i) = strcmp(variable_categorica, unique_val(i));
    end
end
