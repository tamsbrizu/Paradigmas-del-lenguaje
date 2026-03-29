progenitor(joaquin, marcos).
progenitor(joaquin, facundo).
progenitor(florencia, matias).
progenitor(martia, andrea).
hermano(X,Y) :- progenitor(Z,X),progenitor(Z,Y), X /= Y.
