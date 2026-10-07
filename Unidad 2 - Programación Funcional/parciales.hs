-- ejercicios parciales ---

--- parcial Nº2: construya una funcion recursiva que reciba como parametro dos listas ordenadas y genera una unica lista ordenada ascendentemente.
ordenar2L :: (Integral a) => [a] -> [a] -> [a]
ordenar2L [] [] = []
ordenar2L [] y = []
ordenar2L x [] = []
ordenar2L (x:xs) (y:ys)
	| x < y = x : (y : (ordenar2L xs ys))
	| otherwise = y : (x : (ordenar2L xs ys))
	
	
--- parcial Nº2: construya una funcion recursiva que diga el mayor de una lista
mayor :: (Integral a) => [a] -> a
mayor [x] = x
mayor (x:xs)
	| x > maximum xs = x
	| otherwise = mayor xs
	
--- propuesto: construye una funcion recursiva que diga el menor de los valores
menor :: (Integral a) => [a] -> a
menor [x] = x
menor (x:xs)
	|x < minimum xs = x
	|otherwise = menor xs
	
	
--- parcial Nº2: construya una funcion que reciba una lista de numero y entregue la lista de numeros ordenada (!!!)
ordenadaLN :: (Integral a) => [a] -> [a]
ordenadaLN [] = []
ordenadaLN (x:y:xs)
	|  x < y = x : (y: ordenadaLN xs)
	| otherwise = y : (x: ordenadaLN xs)
	
--- parcial Nº2: construya una funcion recursiva que reciba un numero y entregue una lista con los divisores de dicho numero
divisores :: (Integral a) => a -> a -> [a]
divisores x y
	|x < y = []
	|mod x y == 0 = y : (divisores x (y+1))
	|otherwise = divisores x (y+1)
	
--- propuesto: Construir una función recursiva que reciba una lista y devuelva la suma de sus elementos
sumar :: (Integral a) => [a] -> a
sumar [] = 0
sumar (x:xs) = x + sumar xs
	
--- propuesto: Construir una función recursiva que reciba una lista y devuelva la lista invertida.
invertir :: (Integral a) => [a] -> [a]
invertir [] = []
invertir (x:xs) = (invertir xs) ++ [x]

--- propuesto: Construir una función recursiva que reciba dos listas y devuelva una sola lista intercalando elementos.
intercalar :: (Integral a) => [a] -> [a] -> [a]
intercalar [][] = []
intercalar x [] = x
intercalar [] y = y
intercalar (x:xs) (y:ys) = x : (y: intercalar xs ys)

--- propuesto: Construir una función recursiva que reciba una lista y devuelva solo los números pares.
pares :: (Integral a) => [a] -> [a]
pares [] = []
pares (x:xs)
	| even x = x : pares xs
	| otherwise = pares xs
	
	
--- ejercicio Nº13: suma de matrices
sumaMatricesFila :: (Integral a) => [[a]] -> [[a]] -> [[a]]
sumaMatricesFila [] [] = []
sumaMatricesFila (x:xs) (y:ys) = (sumarFila x y) : (sumaMatricesFila xs ys)

sumarFila :: (Integral a) => [a] -> [a] -> [a]
sumarFila [] [] = []
sumarFila (x:xs) (y:ys) = (x+y) : (sumarFila xs ys)