--- recuperatorio parcial 2024. Suma de polinomios.

sumaPoli :: (Integral a) => [[a]] -> [[a]] -> [[a]]
sumaPoli [][] = []
sumaPoli (x:xs) (y:ys)
	|(last x) == (last y) = [ (head x) + (head y), last x] : (sumaPoli xs ys)
	| (last x) > (last y) = x : (y : (sumaPoli xs ys))
	| (last y) > (last x) = y : (x : (sumaPoli xs ys))
	
	
--- parcial 2024. Traduccion de palabras.

traduce :: [String] -> [[String]] -> [String]
traduce [] y = []
traduce (x:xs) y = (traduccion x y) : (traduce xs y)
	
traduccion :: String -> [[String]] -> String
traduccion x [] = "*"
traduccion x (y:ys)
	| x == (head y) = last y
	| otherwise = traduccion x ys
	
	
--- propuesto Nº1. Lista aplanada

listaUnNivel :: [[a]] -> [a]
listaUnNivel [] = []
listaUnNivel (x:xs) = x ++ listaUnNivel xs


--- propuesto Nº5. Escriba un programa que recibiendo como argumento una lista de listas donde cada sublista contiene nombre del docente, 
--- dedicación y carrera donde trabaja; entregue como resultado una lista con los nombres de los docentes que cobrarán un plus considerando 
--- que los cobrarán aquellos docentes que tenga solamente un cargo con dedicación simple.

--- ejemplo: plus [["Ana","Exclusivo","LSI"],["Mary","Semi","LCC"],["Jose","Simple","LSI"], ["Mary","Simple","LSI"], ["Pepe","Simple","LSI"],…..]  
--- -> [“Jose”, “Pepe”, ….]   

plus :: [[String]] -> [String]
plus personas = [nombre | [nombre, dedicación,_] <- personas, dedicación == "Simple"]

plus2 :: [[String]] -> [String]
plus2 [] = []
plus2 (x:xs)
	| "Simple" `elem` x = (head x) : plus xs
	| otherwise = plus2 xs
	
--- mayor de una lista (Recursion)
mayor :: (Integral a) => [a] -> a
mayor [x] = x
mayor (x:xs)
	| x > maximum xs = x
	| otherwise = mayor xs
	
menor :: (Integral a) => [a] -> a
menor [x] = x
menor (x:xs)
	| x < minimum xs = x
	| otherwise = menor xs
	
--- dada dos lista ordenas, entregar una sola lista ordenada.
listaOrdenada :: (Integral a) => [a] -> [a] -> [a]

listaOrdenada [] [] = []
listaOrdenada x [] = x
listaOrdenada [] y = y

listaOrdenada (x:xs) (y:ys)
    | x < y = x : listaOrdenada xs (y:ys)
    | otherwise = y : listaOrdenada (x:xs) ys
	
	
--- dada una lista de numeros y una lista de numeros ordenada, insertar la primera en la segunda sin repetir numeros.
insertar :: (Integral a) => [a] -> [a] -> [a]

insertar [] [] = []
insertar [] y = y
insertar x [] = x

insertar (x:xs) (y:ys)
	| x `elem` ys = insertar xs (y:ys)
	| y `elem` xs = insertar (eliminar (x:xs) y) (y:ys)
	| x < y = x : insertar xs (y:ys)
	| y < x = y : insertar (x:xs) ys
	
	
eliminar :: (Integral a) => [a] -> a -> [a]
eliminar [] y = []
eliminar (x:xs) y
	| x == y = eliminar xs y
	| otherwise = x : eliminar xs y
	
	
--- unirAgendas [["Ana","123"],["Juan","555"]] [["Ana","123"],["Luis","999"]]
--- == [["Ana","123"],["Juan","555"],["Luis","999"]]

unirAgendas :: [[String]] -> [[String]] -> [[String]]
unirAgendas [] [] = []
unirAgendas [] y = y
unirAgendas x [] = x

unirAgendas (x:xs) (y:ys)
	| x `elem` (y:ys) = unirAgendas xs (y:ys)
	| otherwise = x : (y: (unirAgendas xs ys))
	

aprobados :: [[String]] -> [String]
aprobados personas = [nombre | [nombre, nota] <- personas, (read nota :: Int) >= 6]

--- Parcial 2023. Enlace

enlace :: (Integral a) => [[a]] -> [[a]] -> [[a]]
enlace l1 l2 = [[x1,y2] | [x1,x2] <- l1, [y1,y2] <- l2, x2 == y1]


--- Maximos de una lista
--- [[1,5,2],[9,3],[4]]
--- == [5,9,4]

maximos :: (Integral a) => [[a]] -> [a]
maximos [] = []
maximos (x:xs) = (maximum x) : maximos xs

--- Producto de polinomios
--- multiplica 2 [[3,2],[5,1]]
--- == [[6,2],[10,1]]

multiplica :: (Integral a) => a -> [[a]] -> [[a]]
multiplica n [] = []
multiplica n (x:xs) = [(head x) * n, (last x)] : (multiplica n xs) 
	
	
--- entregar los nombres de los productos cuyo precio sea mayor a 1000.
--- [["Pan","200"],["Leche","1500"],["Azucar","900"]]
--- == ["Leche"]

productosCaros :: [[String]] -> [String]
productosCaros p = [nombre | [nombre, precio] <- p, (read precio :: Int) > 1000]

--- con Recursion productosCaros

productosCarosR :: [[String]] -> [String]
productosCarosR [] = []
productosCarosR (x:xs)
	| (read (last x) :: Int) > 1000 = (head x) : productosCarosR xs
	| otherwise = productosCarosR xs
	
--- buscar repetidos
--- [1,2,3,2,5,1]
--- == [1,2]

repetidos :: (Integral a) => [a] -> [a]
repetidos [] = []
repetidos (x:xs)
	| x `elem` xs = x : repetidos xs
	| otherwise = repetidos xs
	
--- cantidad de apariciones
--- ["pan","leche","pan","azucar","pan"]
--- == (pan) 3

cantidadApariciones :: [String] -> String -> Int
cantidadApariciones [] p = 0
cantidadApariciones (x:xs) p
	| x == p = 1 + cantidadApariciones xs p
	| otherwise = cantidadApariciones xs p


--- Invertir sublistas
--- [[1,2,3],[4,5],[7]]
--- == [[3,2,1],[5,4],[7]]

invertirSL :: (Integral a) => [[a]] -> [[a]]
invertirSL [] = []
invertirSL (x:xs) = (invertir x) : invertirSL xs

invertir :: (Integral a) => [a] -> [a]
invertir [] = []
invertir (x:xs) = (invertir xs) ++ [x]

--- multiplicar lista por posicion
--- [1,2,3] [4,5,6]
--- == [4,10,18]

multiplicarL :: (Integral a) => [a] -> [a] -> [a]
multiplicarL x y = zipWith (*) x y