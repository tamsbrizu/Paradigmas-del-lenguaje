-- ejercicio 8
eliminar :: (Integral a) => [a] -> [a]
eliminar [] = []
eliminar (x:xs)
	| x `elem` xs = eliminar(xs)
	| otherwise = x : eliminar xs
	
-- ejercicio 9
binario :: (Integral a) => a -> [a]
binario 1 = []
binario x
	| mod x 2 == 0 = binario (div x 2) ++ [0]
	| mod x 2 == 1 = binario (div x 2) ++ [1]
	
-- ejercicio 10
unionElim :: (Integral a) => [a] -> [a] -> [a]
unionElim [] y = y
unionElim x [] = x
unionElim x y = eliminar (x++y)

-- ejercicio 11
numerosCom x = [sum (map head x), sum (map last x)]

-- ejercicio 12
ordenada :: (Integral a) => [a] -> a -> [a]
ordenada [] y = []
ordenada (x:xs) y 
	| x < y = x : ordenada xs y
	| x > y = y : x : xs
	
--- ejercicio 13
sumaMatrices :: (Integral a) => [a] -> [a] -> [a]
sumaMatrices [][] = []
sumaMatrices x [] = x
sumaMatrices [] y = y
sumaMatrices (x:xs) (y:ys)
	| length xs == length ys = (x+y) : sumaMatrices xs ys
	| otherwise = error "No es posible realizar la suma porque las matrices no son de igual orden"
	
--- ejercicio propuesto Nº1
soloNivel :: (Integral a) => [[a]] -> [a]
soloNivel lista = [x | xs <- lista, x <- xs]

-- ejercicio Parcial
insertar :: (Integral a) => [a] -> [a] -> [a]
insertar [] [] = []
insertar x [] = x
insertar [] y = y
insertar (x:xs) (y:ys)
	| x < y = x : ordenada xs y
	| x > y = y : x : xs