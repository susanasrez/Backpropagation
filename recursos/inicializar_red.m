function red = inicializar_red(n_capa_entrada, n_capa_salida, capas_ocultas)
    red = {};
    capas = [capas_ocultas, n_capa_salida];
    for i = 1:length(capas)
        neuron = capas(i);
        capa_oculta = rand(n_capa_entrada, neuron) * 2 - 1;
        n_capa_entrada = neuron;
        red{end+1} = capa_oculta;
    end
end
