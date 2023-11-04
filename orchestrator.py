import asyncio
import config
import subprocess
from buildPDDL import *
from config import *
from actorsAPI import *
import time

rnd = 0
total_cost = 0

async def executionEngine(rnd, tot_cost):
    domain = f"{config.PDDL['domainName']}.pddl"
    problem = f"{config.PDDL['problemName']}.pddl"

    # Retrieve information of Things and construct PDDL domain and problem files
    print("Collecting problem data...")
    buildPDDL(domain, problem)
    
    # Call planner 
    print("Invoking planner...")

    command = f"./downward/fast-downward.py {domain} {problem} --search 'astar(lmcut())'" 
    result = subprocess.run(command, shell = True, stdout=subprocess.PIPE)
    
    print(f"result planner: {result.returncode}")
    return result.returncode

result = asyncio.get_event_loop().run_until_complete(executionEngine(rnd, total_cost))
while result == 1:
    result = asyncio.get_event_loop().run_until_complete(executionEngine(rnd+1, total_cost))

if result == 0:
    print("Success!")
    print("Total cost: " + str(total_cost))
else:
    print("Plan not found!")
                
