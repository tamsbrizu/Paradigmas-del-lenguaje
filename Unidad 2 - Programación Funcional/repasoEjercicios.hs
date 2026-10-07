--- Construir una funcion que reciba una lista de numeros y genere una lista ordenada ascendetemente
--- [4,2,1,6,8,3]
--- = [1,2,3,4,6,8]

ordenar :: (Integral a) => [a] -> [a]
ordenar [] = []
ordenar x = (minimum x) : ordenar (eliminar (minimum x) x) 


--- Genere una funcion que reciba dos lista ordenadas y genere una unica lista ordenada
--- [1,4,6] [2,3,8]
--- [1,2,3,4,8]

ordenada2L :: (Integral a) => [a] -> [a] -> [a]
ordenada2L [] [] = []
ordenada2L x [] = x
ordenada2L [] y = y
ordenada2L (x:xs) (y:ys)
	| x < y = x : (ordenada2L xs (y:ys))
	| otherwise = y : (ordenada2L (x:xs) ys)
	
--- Construya una funcion recursiva que reciba un numero y genere una lista con los numeros que son divisores de dichos numeros
--- 4 -> [1,2,4]

divisores :: (Integral a) => a -> [a]
divisores x = generarLista x x

generarLista :: (Integral a) => a -> a -> [a]
generarLista x 0 = []
generarLista x y 
	| mod x y == 0 = y : generarLista x (y-1)
	| otherwise = generarLista x (y-1)
	
--- construya una funcion recursiva que obtenga el mayor de una lista.
--- [4,9,6,15] -> 15

maximoRecursivo :: (Integral a) => [a] -> a 
maximoRecursivo [x] = x
maximoRecursivo (x:xs) = max x (maximoRecursivo xs)

--- propuesto: minimo recursivo

minimoRecursivo :: (Integral a) => [a] -> a
minimoRecursivo [x] = x
minimoRecursivo (x:xs) = min x (minimoRecursivo xs)


---- 7. Separar pares e impares. Construir una función que reciba una lista y devuelva una tupla
---- separar [1,2,3,4,5,6] == ([2,4,6],[1,3,5])

separar :: (Integral a) => [a] -> ([a],[a])
separar x = (pares x, impares x)

pares :: (Integral a) => [a] -> [a]
pares [] = []
pares (x:xs)
	| even x = x : pares xs
	| otherwise = pares xs
	
impares :: (Integral a) => [a] -> [a]
impares [] = []
impares (x:xs)
	| odd x = x : impares xs
	| otherwise = impares xs
	
	
--- 8. Buscar un elemento en una lista
--- buscar 4 [1,2,3,4,5] == True

buscar :: Int -> [Int] -> Bool
buscar x [] = False
buscar x (y:ys)
	| x == y = True
	| otherwise = buscar x ys
	
--- 9. Contar ocurrencias. Construir una función que cuente cuántas veces aparece un elemento.
--- ocurrencias 2 [1,2,3,2,4,2] == 2

ocurrencias :: (Integral a) => a -> [a] -> a
ocurrencias x [] = 0
ocurrencias x (y:ys)
		| x == y = 1 + ocurrencias x ys
		| otherwise = ocurrencias x ys
		
--- 11. Merge de listas ordenadas (más difícil). Ahora hacer que funcione incluso si las listas tienen tamaños diferentes.
--- merge [1,4,7,10] [2,3] = [1,2,3,4,7,10]


merge :: (Integral a) => [a] -> [a] -> [a]
merge [] [] = []
merge x [] = x
merge [] y = y
merge (x:xs) (y:ys)
	| x < y = x : (merge xs (y:ys))
	| otherwise = y : (merge (x:xs) ys)
	
--- Construir una función que divida una lista a la mitad.
--- partir [1,2,3,4,5,6] == ([1,2,3],[4,5,6])

--- 14. Máximo y mínimo simultáneamente. Devolver una tupla
--- maxMin [4,7,2,9,1] -> (9,1)

maxMin :: (Integral a) => [a] -> (a,a)
maxMin x = (maximoRecursivo x, minimoRecursivo x)


--- . Compresión de lista (nivel más difícil)
--- [1,1,1,2,2,3,3,3] == [(1,3),(2,2),(3,3)] --- > (numero,cantidad)

numCan :: [Int] -> [(Int, Int)]
numCan [] = []
numCan (x:xs) = (x, contarCan x 1 xs) : numCan (eliminar x xs)

contarCan :: Int -> Int -> [Int] -> Int
contarCan x n [] = 0 
contarCan x n (y:ys)
	| x == y = n + (contarCan x (n+1) ys)
	| otherwise = contarCan x n ys
	
--- 17. Generar sublistas acumuladas
--- acumuladas [1,2,3,4] == [[1],[1,2],[1,2,3],[1,2,3,4]]

acumuladas :: (Integral a) => [a] -> [[a]]
acumuladas x = generarAcumuladas 1 x

generarAcumuladas :: (Integral a) => Int -> [a] -> [[a]]
generarAcumuladas n x 
	| n > length x = []
	| otherwise = (take n x) : generarAcumuladas (n+1) x
	
--- sumaPolinomios [[4,5], [5,2], [7,0]] [[6,3], [7,2], [1,0]] -> [[4,5],[6,3],[12,2],[8,0]]

sumaPolinomios :: (Integral a) => [[a]] -> [[a]] -> [[a]]
sumaPolinomios [] [] = []
sumaPolinomios x [] = x
sumaPolinomios [] y = y
sumaPolinomios (x:xs) (y:ys) 
	| (last x) == (last y) = [(head x + head y), last x] : sumaPolinomios xs ys
	| (last x) < (last y) = y : (x : sumaPolinomios xs ys)
	| otherwise = x : (y : sumaPolinomios xs ys)
	
--- sumaMatrices [[1,2],[4,5]] [[7,3],[4,5]] => [[8,5],[8,10]]

sumaMatrices :: (Integral a) => [[a]] -> [[a]] -> [[a]]
sumaMatrices [] [] = []
sumaMatrices x [] = x
sumaMatrices [] y = y
sumaMatrices (x:xs) (y:ys) = sumarFila x y : sumaMatrices xs ys

sumarFila :: (Integral a) => [a] -> [a] -> [a]
sumarFila [] [] = []
sumarFila x [] = x 
sumarFila [] y = y
sumarFila (x:xs) (y:ys) = (x+y) : sumarFila xs ys

-- multiplosDe 3 [1,3,4,6,9,10]
-- [3,6,9]

multiplosDe ::  Int -> [Int] -> [Int]
multiplosDe n x = calcularMultiplos n 1 x 

calcularMultiplos :: Int -> Int -> [Int] -> [Int]
calcularMultiplos num num2 x
	| num2 == length x = []
	| elem (num * num2) x  =  (num * num2) : calcularMultiplos num (num2 + 1) x
	| otherwise = calcularMultiplos num (num2 + 1) x
	
-- ordenada [1,2,3,4]
-- True

-- ordenada [1,5,2]
-- False

verificarOrdenada :: [Int] -> Bool
verificarOrdenada [x] = True
verificarOrdenada (x:y:xs)
	| x < y = verificarOrdenada (y:xs)
	| otherwise = False
	
-- repetirElementos 3 [1,2]
-- [1,1,1,2,2,2]

repetirElementos :: Int -> [Int] -> [Int]
repetirElementos x [] = []
repetirElementos x (y:ys) = (take x (repeat y)) ++ repetirElementos x ys

--- prefijos [1,2,3]
-- [[],[1],[1,2],[1,2,3]]

prefijos :: [Int] -> [[Int]]
prefijos x = obtenerPrefijos 0 x

obtenerPrefijos :: Int -> [Int] -> [[Int]]
obtenerPrefijos n x
	| n > length x = []
	| otherwise = (take n x) : (obtenerPrefijos (n+1) x)
	
-- consecutivos 2 [1,2,2,3]
-- True

-- consecutivos 4 [1,4,2,4]
-- False

consecutivos :: Int -> [Int] -> Bool
consecutivos n [x] = False
consecutivos n (x:y:xs)
	| (n == x) && (x == y) = True
	| otherwise = consecutivos n (y:xs)
	
-- sublistas 2 [1,2,3,4]
-- [[1,2],[2,3],[3,4]]

sublistas :: Int -> [Int] -> [[Int]]
sublistas n x = obtenerSublistas n 1 x

obtenerSublistas :: Int -> Int -> [Int] -> [[Int]]
obtenerSublistas n d [x] = []
obtenerSublistas n d x = (take n x) : obtenerSublistas n d (drop d x) 

-- transponer [[1,2,3],[4,5,6]]
-- [[1,4],[2,5],[3,6]]

-- acumulada [1,2,3,4]
-- [1,3,6,10]

acumulada :: [Int] -> [Int]
acumulada x = calcularAcumulada x 0

calcularAcumulada :: [Int] -> Int -> [Int]
calcularAcumulada [] r = []
calcularAcumulada (x:xs) r = (x + r) : calcularAcumulada xs (x+r)

--- descendente [1,4,6,9,2,10]
--- [10,9,6,4,2,1]

descendente :: (Integral a) => [a] -> [a]
descendente [] = []
descendente x = (maximum x) : descendente (eliminar (maximum x) x) 

-- particionar 3 [1,2,3,4,5,6,7]
-- [[1,2,3],[4,5,6],[7]]

particionar :: Int -> [Int] -> [[Int]]
particionar n [x] = [[x]]
particionar n x = (take n x) : particionar n (drop n x)

--- enlace [[1,2],[5,6],[20,8]] [[6,100],[1,200],[3,300],[2,400],[8,500]]
--- [[1,100],[5,100],[20,500]

enlace :: [[Int]] -> [[Int]] -> [[Int]]
enlace [] y = []
enlace (x:xs) y = buscarEnlace x y : enlace xs y 

buscarEnlace :: [Int] -> [[Int]] -> [Int]
buscarEnlace x [] = []
buscarEnlace x (y:ys)
	| (last x) == (head y) = [(head x), (last y)]
	| otherwise = buscarEnlace x ys
	
	
--- iterativo
enlaceIterativo :: [[Int]] -> [[Int]] -> [[Int]]
enlaceIterativo l1 l2 = [[(head x), (last y)] | x <- l1, y <- l2, (last x) == (head y)]

-- insertarPos 99 2 [1,2,3,4]
-- [1,2,99,3,4]

insertarPos :: Int -> Int -> [Int] -> [Int]
insertarPos n pb x = buscarPo n pb 0 x

buscarPo :: Int -> Int -> Int -> [Int] -> [Int]
buscarPo n pb pa [] = [] --- pb: posicion buscada, pa: posicion actual
buscarPo n pb pa (x:xs)
	| pb == pa = n : (x:xs)
	| otherwise = x : buscarPo n pb (pa+1) xs

-- eliminarPos 2 [10,20,30,40]
-- [10,20,40]

eliminarPos :: Int -> [Int] -> [Int]
eliminarPos pb x = buscarEliminacion pb 1 x

buscarEliminacion :: Int -> Int -> [Int] -> [Int]
buscarEliminacion pb pa [] = []
buscarEliminacion pb pa (x:xs)
	| pb == pa = buscarEliminacion pb (pa + 1) xs
	| pa > pb = (x:xs)
	| otherwise = x : buscarEliminacion pb (pa+1) xs


-- ultimo [4,7,2,9]
-- 9

ultimo :: [Int] -> Int
ultimo [x] = x
ultimo (x:xs) = ultimo xs


-- sinUltimo [1,2,3,4]
-- [1,2,3]

sinUltimo :: [Int] -> [Int]
sinUltimo [x] = []
sinUltimo (x:xs) = x : sinUltimo xs

-- mayores 5 [1,7,8,2,10]
-- 3

mayoresA :: Int -> [Int] -> Int
mayoresA n [] = 0
mayoresA n (x:xs)
	| x > n = 1 + mayoresA n xs
	| otherwise = mayoresA n xs


-- reemplazar 2 99 [1,2,3,2]
-- [1,99,3,99]

-- diagonal [[1,2,3],[4,5,6],[7,8,9]]
-- [1,5,9]

-- insertarSinRepetir 4 [1,2,5,7]
-- [1,2,4,5,7]

-- insertarSinRepetir 5 [1,2,5,7]
-- [1,2,5,7]

-- interseccion [1,2,3,4] [2,4,6]
-- [2,4]

-- diferencia [1,2,3,4] [2,4]
-- [1,3]

-- aplanar [[1,2],[3,4],[5]]
-- [1,2,3,4,5]

-- union [1,2,3] [2,4]
-- [1,2,3,4]

frecuencia :: [Char] -> [(Char,Int)]
frecuencia [] = []
frecuencia (x:xs) = (x, 1 + sum[1| y <- xs, x == y]) : frecuencia (eliminar x xs)
 
eliminar :: Char -> [Char] -> [Char]
eliminar x [] = []
eliminar x (y:ys)
	| x == y = eliminar x ys
	| otherwise = y : eliminar x ys