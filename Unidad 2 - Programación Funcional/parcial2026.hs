--- parcial

frecuencia :: [Char] -> [(Char,Int)]
frecuencia [] = []
frecuencia (x:xs) = (x, 1 + sum[1| y <- xs, x == y]) : frecuencia (eliminar x xs)
 
eliminar :: Char -> [Char] -> [Char]
eliminar x [] = []
eliminar x (y:ys)
	| x == y = eliminar x ys
	| otherwise = y : eliminar x ys
	

funcional :: (Ord o) => [[o]] -> [[o]]
funcional [] = []
funcional (x:xs) = concat [[y, head x] | y <- tail x] : funcional xs