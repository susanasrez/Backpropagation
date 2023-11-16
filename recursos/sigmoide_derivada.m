function derivada = sigmoide_derivada(x)
    derivada = sigmoide(x) .* (1 - sigmoide(x));
end
