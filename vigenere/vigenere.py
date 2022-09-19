from curses.ascii import islower, isupper
A = 0.065


def encode(key):
    ''' 使用密钥将明文加密 '''
    with open(file='明文.txt', mode="r", encoding='utf-8') as f:
        original = f.read()
    original = original.upper()
    key = key.upper()
    ciphertext = ""
    i = 0
    for c in original:
        if 'A' <= c and c <= 'Z':
            ciphertext += chr(ord('A') + (ord(c) +
                              ord(key[i % len(key)]) - 2 * ord('A')) % 26)
            i += 1
    with open(file='密文.txt', mode="w", encoding='utf-8') as f:
        f.write(ciphertext)
    return ciphertext


def decode(ciphertext, key):
    ''' 使用密钥将密文解密 '''
    key = key.upper()
    original = ""
    i = 0
    for c in ciphertext:
        original += chr(ord('A') + (ord(c) -
                        ord(key[i % len(key)]) + 26) % 26)
        i += 1
    with open(file='解密后的明文.txt', mode="w", encoding='utf-8') as f:
        f.write(original)
    return original


def get_num(tmp):
    '''获取一个字符列表的重合指数'''
    temp = 0
    for letter in set(tmp):
        temp += tmp.count(letter) * (tmp.count(letter) - 1)
    return temp / len(tmp) / (len(tmp) - 1)


def get_key_length(Ciphertext):
    '''获取密钥的长度'''
    ret, min = 0, 1e9
    for length in range(1, int(len(Ciphertext) / 100)):
        judge = 0
        for i in range(length):
            tmp = list(Ciphertext)[i::length]
            judge += abs(A - get_num(tmp))
        judge /= length
        if judge < min:
            ret, min = length, judge
    return ret


def get_key(Ciphertext, key_length):
    '''获取密钥的值'''
    standard = {'A': 0.082, 'B': 0.015, 'C': 0.028, 'D': 0.043, 'E': 0.127, 'F': 0.022, 'G': 0.020, 'H': 0.061, 'I': 0.070, 'J': 0.002, 'K': 0.008, 'L': 0.040, 'M': 0.024,
                'N': 0.067, 'O': 0.075, 'P': 0.019, 'Q': 0.001, 'R': 0.060, 'S': 0.063, 'T': 0.091, 'U': 0.028, 'V': 0.010, 'W': 0.023, 'X': 0.001, 'Y': 0.020, 'Z': 0.001}
    ans = ["*"] * key_length
    for i in range(key_length):
        tmp = list(Ciphertext)[i::key_length]
        min = 1e9
        for m in range(26):
            judge = 0
            for letter in set(tmp):
                letter_frequercy = tmp.count(letter) / len(tmp)
                k = chr((ord(letter) - ord('A') - m) % 26 + ord('A'))
                standard_frequercy = standard[k]
                judge += letter_frequercy * standard_frequercy
            if abs(judge - A) < min:
                min, ans[i] = abs(judge - A), chr(m + ord('A'))
    return "".join(ans)


if __name__ == "__main__":
    ciphertext = encode("ceyewan")
    key_length = get_key_length(ciphertext)
    print(key_length)
    key = get_key(ciphertext, key_length)
    print(key)
    original = decode(ciphertext, key)
    print(original)
