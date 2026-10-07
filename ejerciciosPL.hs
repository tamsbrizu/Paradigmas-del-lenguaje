-- ejercicio 8
eliminar :: Integral a => [a] -> [a]
eliminar [] = []
eliminar (x:xs)
	| x elem xs = eliminar xs
	| otherwise = x : eliminar xa