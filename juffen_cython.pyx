import cython
import numpy as np

# "cimport" is used to import special compile-time information
# about the numpy module (this is stored in a file numpy.pxd which is
# currently part of the Cython distribution).
cimport numpy as np

# It's necessary to call "import_array" if you use any part of the
# numpy PyArray_* API. From Cython 3, accessing attributes like
# ".shape" on a typed Numpy array use this API. Therefore we recommend
# always calling "import_array" whenever you "cimport numpy"
np.import_array()
# We now need to fix a datatype for our arrays. I've used the variable
# DTYPE for this, which is assigned to the usual NumPy runtime
# type info object.
DTYPE = np.int

# "ctypedef" assigns a corresponding compile-time type to DTYPE_t. For
# every type in the numpy module there's a corresponding compile-time
# type with a _t-suffix.
ctypedef np.int_t DTYPE_t

@cython.cdivision(True)
@cython.cfunc
def juf(n: cython.int, params)-> cython.bint:
    cdef int i
    for i in params:
        if n % i == 0:
            return True
    for i in params:
        if str(i) in str(n):
            return True
    return False


def fillbook(n: cython.int, params: tuple)->cython.bint:
    '''
    Returns a size n dictionary, in which value is False if key is juf.
    '''
    cdef int i
    book = []
    for i in range(n + 1):
        if juf(i, params):
            book.append(False)
        else:
            book.append(True)
    return book

@cython.boundscheck(False) # turn off bounds-checking for entire function
@cython.wraparound(False)
def play(number: cython.int, params: tuple = (3, 5, 8)):
    '''
    Preform search
    '''
    layer: cython.int
    depth: cython.int
    tracker: list
    # ans: np.ndarray = np.zeros((int(number),), dtype=np.int_t)
    cdef np.ndarray ans = np.zeros((int(number),), dtype=DTYPE)

    playbook = fillbook(int(number), params)
    tracker = [0]  # the current number of each depth level
    depth = 1  # length of tracker

    for i in range(2, int(number)):
        if playbook[i]:
            ans[i] = i
            continue
        for layer in range(1, depth):
            evaluate = tracker[layer] + 1
            tracker[layer] = evaluate
            if playbook[evaluate]:
                ans[i] = evaluate
                break
        # if not break then do
        else:
            tracker.append(1)
            depth += 1
            ans[i] = 1
    return np.array(ans)


if __name__ == '__main__':
    test = play(1000000)
    print(test[:50])
