import fire

def to_dec(word):
    res = 0
    for ch in map(ord, word):
        res = 256 * res + ch
    return res

if __name__ == '__main__':
    fire.Fire(to_dec)
