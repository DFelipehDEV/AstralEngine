import argparse
import importlib
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument('--target', nargs='?', const="debug.py", default="debug.py", type=Path,
                    help='Build target file')
args = parser.parse_args()

target_script = args.target;

all_script = Path("all.py")
if all_script.is_file():
    print("-- Generating target all")
    target_module = importlib.import_module("all")
    target_module.build()

print(f"-- Generating target {target_script}")
target_module = importlib.import_module(target_script.stem)
target_module.build()