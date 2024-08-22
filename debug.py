CONSTANTS_PATH = 'src/settings/constants.txt'

def build():
    with open(CONSTANTS_PATH, 'r') as file:
        lines = file.readlines()

    with open(CONSTANTS_PATH, 'w') as file:
        for line in lines:
            if line.startswith('DEBUG='):
                file.write('DEBUG=1\n')
                print("DEBUG: 1")
            else:
                file.write(line)