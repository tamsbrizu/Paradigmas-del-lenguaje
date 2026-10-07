--- Parcial Nº2. 2025. ejercicio 2
listaOrdenada :: (Integral a) => [a] -> [a] -> [a]
listaOrdenada [] [] = []
listaOrdenada [] y = y
listaOrdenada x [] = x

listaOrdenada (x:xs) (y:ys)
	| x < y = x : listaOrdenada xs (y:ys)
	| y < x = y : listaOrdenada (x:xs) ys
	
--- Parcial Nº2. 2023. Lista de numeros y una lista de numeros ordenada. Inserte la primera lista en la segunda y que no haya elementos repetidos.
insertar :: (Integral a) => [a] -> [a] -> [a]
insertar [] [] = []
insertar [] y = y
insertar x [] = x
insertar (x:xs) (y:ys)
	| elem x (y:ys) = insertar xs (y:ys)
	| elem y (x:xs) = insertar (eliminar (x:xs) y) (y:ys)
	| x < y = x : insertar xs (y:ys)
	| y < x = y : insertar (x:xs) ys
	
eliminar :: (Integral a) => [a] -> a -> [a]
eliminar [] y = []
eliminar (x:xs) y
	| x == y = eliminar xs y
	| otherwise = x : (eliminar  xs y)
	
	
--- Ejercicio N°5: Definir una función que cuente los elementos pares de una lista de números. 
ejercicio5 :: (Integral a) => [a] -> a
ejercicio5 lista5 = sum[1 | x <- lista5, even x]


--- Ejercicio Nº 6: Definir una función que reciba una lista de listas y entregue la cantidad de elementos de la lista de mayor longitud. 
ejercicio6 :: [[a]] -> Int
ejercicio6 lista6 = maximum [length x | x <- lista6]

--- Ejercicio Nº 7: Definir una función que transforme una lista de números en otra lista que contenga el cubo de cada elemento. 
ejercicio7 :: (Integral a) => [a] -> [a]
ejercicio7 lista7 = [x^3 | x <- lista7]

--- Ejercicio Nº 8: Definir una función recursiva que permita eliminar los elementos repetidos de una lista de átomos. 
--- [1,4,5,3,4,9,3]
--- == [1,4,5,3,9]

ejercicio8 :: (Integral a) => [a] -> [a]
ejercicio8 [] = []
ejercicio8 (x:xs)
	| x `elem` xs = ejercicio8 xs
	| otherwise = x : ejercicio8 xs


--- Ejercicio Nº 9: Implementar una función recursiva que pase un número decimal a binario 
ejercicio9 :: (Integral a) => a -> [a]
ejercicio9 1 = []
ejercicio9 x
	| mod x 2 == 0 = ejercicio9 (div x 2) ++ [0]
	| mod x 2 == 1 = ejercicio9 (div x 2) ++ [1]


--- Ejercicio Nº 10: Implementar una función recursiva que permita obtener la unión de dos listas dadas; los elementos repetidos solo deben aparecer una vez. 
ejercicio10 :: (Integral a) => [a] -> [a] -> [a]
ejercicio10 x y = ejercicio8(x ++ y)


--- Ejercicio Nº 11: Construir un programa no recursivo que realice la suma de números complejos, 
--- los cuales se ingresan en sublistas con pares de números donde el primer elemento es la componente real y el segundo la componente imaginaria. 

ejercicio11 :: (Integral a) => [[a]] -> [a]
ejercicio11 listac = [sum (map head listac), sum (map last listac)]


--- Ejercicio Nº 12: Dada una lista ordenada y un átomo escribir una función que inserte el átomo en el lugar correspondiente 
ejercicio12 :: (Integral a) => [a] -> a -> [a]
ejercicio12 [] x = []
ejercicio12 (y:ys) x
	| x < y = x : (y:ys)
	| otherwise = y : ejercicio12 ys x

--- Ejercicio Nº 13: Calcular la suma de dos matrices.

--- [[1,2],[2,3],[4,1]]
--- == [1,2,3,4]

unirNoR :: (Integral a) => [[a]] -> [a]
unirNoR rep = eliminarR (unirSinRepetidos rep)

unirSinRepetidos :: (Integral a) => [[a]] -> [a]
unirSinRepetidos [] = []
unirSinRepetidos (x:xs) = x ++ unirSinRepetidos xs

eliminarR :: (Integral a) => [a] -> [a]
eliminarR [] = []
eliminarR (x:xs)
	| x `elem` xs = eliminarR xs
	| otherwise = x : (eliminarR  xs)


--- [["Pan","2"],["Leche","3"],["Pan","4"]]
--- == [["Pan","6"],["Leche","3"]]


--- Definir una función recursiva que reciba dos listas ordenadas y entregue una nueva lista ordenada que contenga solamente los elementos que aparecen en ambas listas.
--- interseccion [1,2,4,7] [2,4,5,8]
--- == [2,4]

interseccion :: (Integral a) => [a] -> [a] -> [a]
interseccion [] y = []
interseccion (x:xs) y
	| elem x y = x : (interseccion xs y)
	| otherwise = interseccion xs y
	
	
--- Definir una función que reciba una lista de listas de números y entregue una lista con la suma de cada sublista.
--- sumas [[1,2,3],[4,5],[7]]
--- == [6,9,7]

sumas :: (Integral a) => [[a]] -> [a]
sumas lista = [sum x | x <- lista]		--- tambien: map (sum) lista


--- Implementar una función que transforme una lista de números en otra lista con el doble de los números pares.
--- doblePares [1,2,3,4]
--- == [4,8]

doblePares :: (Integral a) => [a] -> [a]
doblePares lista = [x^2 | x <- lista, even x]

--- Definir una función no recursiva que entregue los nombres de los alumnos cuya nota sea impar
--- impares [["Ana","7"],["Luis","4"],["Mario","9"]]
---- == ["Ana","Mario"]

impares :: [[String]] -> [String]
impares personas = [nombre | [nombre, nota] <- personas, odd (read nota :: Int)]

--- Definir una función recursiva que entregue el menor elemento de cada sublista.
--- minimos [[7,2,9],[4,1],[8,5]]
--- == [2,1,5]

minimos :: (Integral a) => [[a]] -> [a]
minimos [] = []
minimos (x:xs) = minimum x : minimos xs

--- Implementar una función que reciba una lista de productos y entregue el promedio de precios.
--- promedio [["Pan","200"],["Leche","400"],["Azucar","300"]]
--- == 300

--- iterativo
promedio :: [[String]] -> Int
promedio productos = div (sum [(read precio :: Int) | [_, precio] <- productos]) (length productos)

--- recursivo
promedio2 :: [[String]] -> Int
promedio2 productos =  div (suma productos) (length productos)

suma :: [[String]] -> Int
suma [] = 0
suma (x:xs) = (read (last x) :: Int) + (suma xs)
