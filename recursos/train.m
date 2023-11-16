function [red_entrenada, cross_entropy_historico, accuracy_historico] = train(red, entrada, y_esperada, epochs, batch_size)
    cross_entropy_historico = zeros(1, epochs);
    accuracy_historico=zeros(1, epochs);
    num_samples = size(entrada, 1);
    num_batches = ceil(num_samples / batch_size);

    for epoch = 1:epochs
        for batch = 1:num_batches
            start_idx = (batch - 1) * batch_size + 1;
            end_idx = min(batch * batch_size, num_samples);
            batch_input = entrada(start_idx:end_idx,:);
            batch_output = y_esperada(start_idx:end_idx,:);

            respuestas = feed_forward(batch_input, red);
            cross_entropy_historico(epoch) = cross_entropy_historico(epoch) + categorical_cross_entropy(respuestas{end}, batch_output);

            gradientes = backpropagation(red, respuestas, batch_output);
            red = descenso_gradiente(red, gradientes, 0.005);
        end

        cross_entropy_historico(epoch) = cross_entropy_historico(epoch) / num_batches;

        responses_final = feed_forward(entrada, red);
        responses_final = responses_final{end};
        num_muestras = size(y_esperada, 1);
        [~, clase_predicha] = max(responses_final, [], 2);
        [~, clase_esperada] = max(y_esperada, [], 2);

        predicciones_correctas = sum(clase_predicha == clase_esperada);

        accuracy = predicciones_correctas / num_muestras;
        accuracy_historico(epoch) = accuracy;

        fprintf('Epoch %d/%d - loss: %.4f - accuracy: %.2f%%\n', epoch, epochs, cross_entropy_historico(epoch), accuracy * 100);
        if accuracy*100 >= 99
            break
        end
    end

    cross_entropy_historico = cross_entropy_historico(1:epochs);

    red_entrenada = red;
end
