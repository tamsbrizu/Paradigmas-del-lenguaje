--- seguimiento 2023
arma :: [a] -> [[a]]
arma [] = [[]]
arma (x:xs) = [x:ys | ys <- lista] ++ lista
	where lista = arma xs
	
--- tema 3. Parcial 2025. ejercicio 2. (mayor en la lista)
mayor :: (Integral a) => [a] -> a
mayor (x:xs)
	| x < maximum xs = mayor xs
	| otherwise = x

--- menor de la lista
menor :: (Integral a) => [a] -> a
menor (x:xs)
	| x < minimum xs = x
	| otherwise = menor xs
	
	
--- tema 4. Parcial 2025. ejercicio 2. (lista de divisores)
divisores :: (Integral a) => a -> a -> [a]
divisores x y
	| y > x = []
	| mod x y == 0 = y : (divisores x (y+1))
	| otherwise = divisores x (y+1)
	
--- tema 2. Parcial 2025. ejercicio 2. (lista de numeros ordenada)
listaAleOrd :: (Integral a) => [a] -> [a]
listaAleOrd [x] = [x]
listaAleOrd (x:y:xs)
	| x < y = x : listaAleOrd (y:xs)
	| x > y = y : listaAleOrd (x:xs)
	
--- recuperatorio parcial 2024. Suma de polinomios.
sumaPoli :: (Integral a) => [[a]] -> [[a]] -> [[a]]
sumaPoli [] [] = []
sumaPoli (x:xs) (y:ys)
	| (last x) == (last y) = [(head x) + (head y), last x] : (sumaPoli xs ys)
	| otherwise = x : y : (sumaPoli xs ys)
	
--- parcial 2. 2024
textoarticulo :: [[String]] -> [String] -> Int
textoarticulo [] y = 0
textoarticulo (x:xs) y = (cuentaArticulos x y) + textoarticulo xs y

cuentaArticulos :: [String] -> [String] -> Int
cuentaArticulos [] y = 0
cuentaArticulos (x:xs) y
	| x `elem` y = 1 + cuentaArticulos xs y
	| otherwise = cuentaArticulos xs y
	
--- otra forma de hacer cuentaArticulos
cuentaArticulos2 :: [[String]] -> [String] -> Int
cuentaArticulos2 texto articulo = sum[1 | oracion <- texto, palabra <- oracion, palabra `elem` articulo]