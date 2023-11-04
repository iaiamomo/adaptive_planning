import subprocess
import sys
import glob
from typing import List
import json

if __name__ == "__main__":

    processes: List[subprocess.Popen] = []
    
    list_devices = glob.glob(f"actors_api_plan/descriptions/*.json")
    
    for configuration_path in list_devices:
        script = f"run_service_plan.py"
        process = subprocess.Popen([sys.executable, script, configuration_path])
        processes.append(process)

    for process in processes:
        process.wait()
