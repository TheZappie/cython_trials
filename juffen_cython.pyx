import cython
import numpy as np


@cython.cdivision(True)
def juf(n, params):
    cdef int i
    for i in params:
        if n % i == 0:
            return True
    for i in params:
        if str(i) in str(n):
            return True
    return False


def fillbook(n, params):
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


def play(number, params = (3, 5, 8)):
    '''
    Preform search
    '''
    cdef int layer, depth
    cdef list tracker
    cdef int[:] ans = np.zeros((int(number),), dtype=np.int32)

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
