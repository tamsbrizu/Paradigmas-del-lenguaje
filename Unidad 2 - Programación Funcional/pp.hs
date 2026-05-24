pp::(Integral a) => [[a]] -> [a]
pp [] = []
pp (x:xs) = [head x] ++ pp xs

--- parcial Nº1: construya una funcion recursiva que reciba como parametro un numero y entregue una lista con los divisores de tal numero.
divisores :: (Integral a) => a -> [a]
divisores

--- parcial Nº1: construya una funcion recursiva que obtenga el mayor de una lista de numero.

--- parcial Nº1: construya una funcion que reciba como parametro una lista ordenada y genere una lista ordenada ascendentemente.

--- parcial Nº1: construya una funcion que reciba como parametro dos listas e inserta los elementos de la primera en la segunda de forma ascendentemente, sin repetir numeros.