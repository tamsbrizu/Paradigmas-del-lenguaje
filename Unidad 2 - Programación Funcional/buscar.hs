buscar::[[Char]] -> [[Char]]
buscar [ ] = [ ]
buscar (x:xs) = [p | p <- x, elem p ['a'..'z']] : buscar xs