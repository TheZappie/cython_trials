def juf(n, params):
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
    book = []
    for i in range(n + 1):
        if juf(i, params):
            book.append(False)
        else:
            book.append(True)
    return book


def func():
    raise ValueError()


def play(n, params=(3, 5, 8)):
    '''
    Preform search
    '''
    playbook = fillbook(int(n), params)
    tracker = [0]  # the current number of each depth level
    ans = [1]
    depth = 1  # length of tracker

    for i in range(2, int(n)):
        if playbook[i]:
            ans.append(i)
            continue
        for layer in range(1, depth):
            evaluate = tracker[layer] + 1
            tracker[layer] = evaluate
            if playbook[evaluate]:
                ans.append(evaluate)
                break
        # if not break then do
        else:
            tracker.append(1)
            depth += 1
            ans.append(1)
    return ans


if __name__ == '__main__':
    test = play(1000000)
    print(test[:50])
