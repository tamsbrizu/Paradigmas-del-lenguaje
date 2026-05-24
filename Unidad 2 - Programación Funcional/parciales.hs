--- parcial Nº1: construya una funcion recursiva que reciba como parametro dos listas ordenadas y genera una unica lista ordenada ascendentemente.
ordenar2L :: (Integral a) => [a] -> [a] -> [a]
ordenar2L [] [] = []
ordenar2L [] y = []
ordenar2L x [] = []
ordenar2L (x:xs) (y:ys)
	| x < y = x : (y : (ordenar2L xs ys))
	| otherwise = y : (x : (ordenar2L xs ys))

	
--- seguimientos
funcion :: (Integral a) => [[a]] -> [[a]]
funcion (x:xs)
	| xs == [] = [[a] | a <- x]
	| otherwise = zipWith (:) x (funcion xs)

--- duplicar [[1,2],[2,4]]
--- == [[2,4],[4,8]]

	
duplicar :: (Integral a) => [[a]] -> [[a]]
duplicar [] = []
duplicar (x:xs) = map (*2) x : duplicar xs  --- es lo mismo poner: duplicar (x:xs) = map (2*) x : duplicar xs


--- insertar 9 [1,2]
--- == [[9,1,2],[1,9,2],[1,2,9]]

insertar :: Int -> [Int] -> [[Int]]
insertar x [] = [[x]]
insertar x (y:ys) = ([x] ++ (y:ys)) : map ([y] ++) (insertar x ys)