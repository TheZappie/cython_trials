# import pyximport; pyximport.install(pyimport=True)
import timeit
import juffen
import juffen_cython

show = 5
n = 1E6+1
repeat = 1

test = juffen_cython.play(n)
print(test[:show])
print(test[-show:])

print()

test = juffen.play(n)
print(test[:show])
print(test[-show:])

print(timeit.timeit(stmt=f'juffen.play({n})', setup='import juffen', number=repeat))
print(timeit.timeit(stmt=f'juffen_cython.play({n})', setup='import juffen_cython', number=repeat))