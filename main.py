# import pyximport; pyximport.install(pyimport=True)
import timeit
import juffen
import juffen_cython

n = 1E6

test = juffen_cython.play(n)
print(test[:50])
print(test[-50:])

print()

test = juffen.play(n)
print(test[:50])
print(test[-50:])

print(timeit.timeit(stmt=f'juffen.play({n})', setup='import juffen', number=1))
print(timeit.timeit(stmt=f'juffen_cython.play({n})', setup='import juffen_cython', number=1))