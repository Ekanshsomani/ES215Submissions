import subprocess
import re
from statistics import stdev

py_files = ["mult.py", "multNum.py"]
cp_file = "multInt.cpp"
root = "Assignment 1/"
inputs = [64, 128, 256, 512, 1024]

def runCommand(command):
    result = subprocess.run(command, shell=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    return result.stdout

def parseOutput(output):
    values = re.findall(r'\d+\.\d+', output)
    values = [float(value) for value in values]
    return values

def printTables(table, language):

    print(f"| {language} |", " | ".join(map(str, inputs)), "|")
    print("| --- | --- | --- | --- | --- | ---- |")

    for key in table:
        vals = []
        sd = []
        for lis in table[key]:
            vals.append(sorted(lis)[1])
            sd.append(stdev(lis))

        formattedVal = [f"{median}±{std_dev}" for median, std_dev in zip(vals, sd)]
        print(f"| {key} | "," | ".join(map(str, formattedVal)), "|")
            

def testFile(file, language):
    table = {"meat": [], "real": [], "user": [], "sys": []}

    for n in inputs:
        meatTime = []
        realTime = []
        userTime = []
        sysTime = []
        for _ in range(3):

            if language=="C++": ans = runCommand(f"/usr/bin/time -p ./a {n}")
            else: ans = runCommand(f"/usr/bin/time -p python3 \"Assignment 1/{file}\" {n} 99")
            
            times = parseOutput(ans)
            
            meatTime.append(times[0])
            realTime.append(times[1])
            userTime.append(times[2])
            sysTime.append(times[3])

        table["meat"].append(meatTime)
        table["real"].append(realTime)
        table["user"].append(userTime)
        table["sys"].append(sysTime)
    
    printTables(table, language)

# ans = run_command(f"/usr/bin/time -p python3 \"Assignment 1/{py_files[0]}\" {inputs[0]} 99")
# parse_time(ans)

command = ["g++", "-o", "a", "Assignment 1/multInt.cpp"]
subprocess.run(command)

testFile(cp_file, "C++")
