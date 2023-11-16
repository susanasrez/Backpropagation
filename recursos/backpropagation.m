function gradientes = backpropagation(red, respuestas, y)
    num_capas = length(red);
    gradientes = cell(size(red));
    for i = 1:num_capas
        gradientes{i} = zeros(size(red{i}));
    end

    error = softmax_cross_entropy_derivada(respuestas{num_capas+1}, y);

    for i = num_capas:-1:1
        if i==num_capas
            activacion_anterior=respuestas{i};
            gradiente=error' * activacion_anterior;
        else
            activacion_anterior=respuestas{i};
            w=red{i+1};
            activacion_actual=respuestas{i+1};
            derivada_activacion=activacion_actual .* (1 - activacion_actual);
            error=error*w'.*derivada_activacion;
            gradiente= error'*activacion_anterior;
        end
        gradientes{i} = -gradiente'; 
    end
end

