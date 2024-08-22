from datetime import date

CONSTANTS_PATH = 'src/settings/constants.txt'

def find_version():
    with open('VERSION', 'r') as version_file:
        return version_file.read().strip()
    
def build():
    CONSTANTS = {
        'VERSION': f'"{find_version()}"',
        'BUILD_DATE': f'"{date.today()}"',
    }
    with open(CONSTANTS_PATH, 'r') as file:
        lines = file.readlines()

    with open(CONSTANTS_PATH, 'w') as file:
        print(f"- Settings constants in {CONSTANTS_PATH}")
        for line in lines:
            key = line.split('=')[0]
            if key in CONSTANTS:
                file.write(f'{key}={CONSTANTS[key]}\n')
                print(f"{key}: {CONSTANTS[key]}")
            else:
                file.write(line)