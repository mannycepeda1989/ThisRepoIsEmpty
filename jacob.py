import os
import sys
import cryptography.fernet

def main():
    key = cryptography.fernet.Fernet.generate_key()
    try:
        with open("key", "wb") as fp:
            fp.write(key)
    except Exception as ex:
        print("Failed to save key.")
        print(ex)
        return
    print("Key Generated: ", end='')
    print(key.decode())
    return
                 
if __name__ == '__main__':
    main()
    sys.exit()
