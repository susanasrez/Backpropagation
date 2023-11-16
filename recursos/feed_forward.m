function respuestas = feed_forward(entrada, red)
    capa_entrada = entrada;
    
    respuestas = {capa_entrada}; 
    
    for i = 1:length(red)
        if i < length(red)
            respuesta = sigmoide(capa_entrada * red{i});
        else
            respuesta = softmax(capa_entrada * red{i});
        end
        capa_entrada = respuesta;
        respuestas{i+1} = respuesta;
    end
end



