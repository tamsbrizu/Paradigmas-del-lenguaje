--- Definir una función recursiva que reciba una lista y entregue una lista de tuplas donde cada elemento esté acompañado por su cantidad de apariciones.
--- frecuencia [1,2,1,3,2,1]
--- == [(1,3),(2,2),(3,1)]

frecuencia :: (Integral a) => [a] -> [(a,a)]
frecuencia [] = []
frecuencia (x:xs) = (cantidad x xs) : frecuencia (eliminar x xs)

cantidad :: (Integral a) => a -> [a] -> (a, a)
cantidad x [] = (x,1)
cantidad x (y:ys)
	| x == y = (x, 1 + snd (cantidad x ys))
	| otherwise = (x, snd (cantidad x ys))
	
eliminar :: (Integral a) => a -> [a] -> [a]
eliminar x [] = []
eliminar x (y:ys)
	| x == y = eliminar x ys
	| otherwise = y : eliminar x ys
	
--- Implementar una función recursiva que elimine las sublistas vacías de una lista de listas.
--- quitarVacias [[1,2],[],[3],[],[]]
--- == [[1,2],[3]]

quitarVacias :: (Integral a) => [[a]] -> [[a]]
quitarVacias [] = []
quitarVacias (x:xs)
	| null x = quitarVacias xs
	| otherwise = x : (quitarVacias xs)
	
	
--- Construir una función recursiva que entregue la intersección entre dos listas sin repetir elementos.
--- interseccion [1,2,3,2,4] [2,4,4,7]
--- == [2,4]

interseccion :: (Integral a) => [a] -> [a] -> [a]
interseccion [] y = []
interseccion (x:xs) y
	| elem x y = x : interseccion (eliminar x xs) y
	| otherwise = interseccion xs y
	
--- Definir una función recursiva que reciba una lista de listas y entregue solamente aquellas cuya suma sea mayor a 20.
--- filtrar [[1,2],[10,15],[4,3],[9,20]]
--- == [[10,15],[9,20]]

filtrar :: (Integral a) => [[a]] -> [[a]]
filtrar [] = []
filtrar (x:xs)
	| sum x > 20 = x : filtrar xs
	| otherwise = filtrar xs
	
--- Diferencia de dos listas
--- diferencia [1,2,3,4] [2,4]
--- == [1,3]

diferencia :: (Integral a) => [a] -> [a] -> [a]
diferencia [] y = []
diferencia (x:xs) y 
	| notElem x y = x : diferencia xs y
	| otherwise = diferencia xs y
	
--- Definir una función recursiva que entregue todas las posiciones donde aparece un elemento.
--- posiciones 4 [7,4,9,4,7,5]
--- == [1,3]

posiciones :: (Integral a) => a -> a -> [a] -> [a]
posiciones x p [] = []
posiciones x p (y:ys)
	| x == y = p : posiciones x (p+1) ys
	| otherwise = posiciones x (p+1) ys
	
--- Construir una función recursiva que elimine solamente la primera aparición de un elemento.
--- eliminarPrimero 4 [1,4,2,4,7]
-- == [1,2,4,7]

eliminarPrimero :: (Integral a) => a -> a -> [a] -> [a]
eliminarPrimero x a [] = []
eliminarPrimero x a (y:ys)
	| x == y && a == 1 = eliminarPrimero x (a+1) ys
	| otherwise = y : eliminarPrimero x a ys
	
--- Implementar una función recursiva que entregue la lista de diferencias consecutivas.
--- diferencias [10,7,5,1]
--- == [3,2,4]

diferencias :: (Integral a) => [a] -> [a]
diferencias [] = []
diferencias [x] = [x]
diferencias (x:y:xs) = (x - y) : diferencias (y:xs)

--- Definir una función recursiva que determine si una lista está ordenada crecientemente.
--- ordenada [1,2,3,7] == True
--- ordenada [1,5,2] == False

ordenada :: [Int] -> Bool
ordenada [] = True
ordenada [x] = True
ordenada (x:y:xs)
	| x < y = ordenada (y:xs)
	| y < x = False
	
--- Construir una función recursiva que entregue el elemento que más veces aparece.
--- masFrecuente [1,2,1,3,2,1] (!!)
--- == 1

masFrecuente :: (Integral a) => [a] -> [[a]]
masFrecuente [] = []
masFrecuente (x:xs) = [x, cantidadEle x xs] : masFrecuente (eliminar x xs)

cantidadEle :: (Integral a) => a -> [a] -> a
cantidadEle x [] = 1
cantidadEle x (y:ys)
	| x == y = 1 + cantidadEle x ys
	| otherwise = cantidadEle x ys
	
--- sumarColumnas [[1,2,3],[4,5,6],[7,8,9]]
--- == [12,15,18] (!!)

cuentaArticulos :: [[String]] -> [String] -> Int
cuentaArticulos texto articulo= sum[1 | oracion <- texto, palabra <- oracion, elem palabra articulo]

--- sufijo [1,2,3]
--- == [[1,2,3],[2,3],[3],[]]

sufijo :: (Integral a) => [a] -> Int -> [[a]]
sufijo x y
	| y > length x = []
	| otherwise = drop y x : sufijo x (y+1)
	
--- prefijos [1,2,3]
--- == [[],[1],[1,2],[1,2,3]]

prefijo :: (Integral a) => [a] -> Int -> [[a]]
prefijo x y
	| y > length x = []
	| otherwise = take y x : sufijo x (y+1)