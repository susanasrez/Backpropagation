function red = descenso_gradiente(red, gradientes, tasa_aprendizaje)
    num_capas = length(red);
    
    for i = 1:num_capas
        red{i} = red{i} - tasa_aprendizaje * gradientes{i};
    end

end
