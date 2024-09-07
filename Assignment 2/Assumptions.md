**Name:** Ekansh Somani
**Roll:** 20110065

**Why this document?**

I had submitted the assignment much earlier but I forgot to list the assumptions. There is no space to list assumptions on paper where I solved the assignment. I am thus merging this document with my solution. I would be grateful if you could accept it.

## List of assumptions

### Q1.

1. **No Overhead:** There is no additional overhead introduced by the enhancement.
2. **Divisibility:** The task can be divided into two parts: : the part that benefits from the enhancement (floating-point operations) and the part that does not (the rest of the task).
3. Proportion of execution time spent on floating point operations (40%) is accurate and remains constant.
4. The speedup factor applies uniformly to all floating-point operations.

### Q2.

1. **Consistency of Benchmark Program:** The benchmark program executes the same set of instructions on each system.
2. **Fixed Workload:** The workload (number of instructions, type of operations, etc.) remains constant across all systems. The program’s behavior and resource requirements do not change.
3. **Multiple Tests and Averaging:** Multiple tests are conducted on each system, and the mean or median execution time is used. This helps to account for variability in execution times due to factors like system load, background processes, and other transient conditions.
4. **Stable System Performance:** The performance of each system is stable and does not fluctuate significantly during the benchmark runs. This ensures that the measured execution times are representative of the system’s typical performance.
5. **No External Interference:** The benchmark runs are not affected by external factors such as network latency, disk I/O contention, or other environmental conditions that could skew the results.

### Q3.

1. The rest of the program other than the bottleneck is parallelizable. 
2. **Fixed Workload:** The total work remains constant.
3. **Speedup Factor:** The parallel part is sped up by a factor of 5.
4. **No Overhead:** No additional costs for parallelization.
5. **Strong Scaling:** The problem scales linearly with the number of processors.

### Q4.

1. **Divisibility of the Task:** The system’s task that are being divided into four distinct components aren't interspersed. In other words, they are either relatively independent or sequentially dependent.
2. **Proportion of Execution Time:** The proportions of the total execution time for each component (5%, 20%, 45%, and 30%) are accurately known and remain constant.
3. **Fixed Workload:** The total amount of work to be done by the system remains constant. The problem size does not change, and the same number of operations are performed before and after the improvements.
4. **No Overhead:** There is no additional overhead introduced by the improvements. The speedup is purely due to the enhancements made to each component.
5. **Independent Improvements:** Improvements to each component are independent of each other and do not affect the performance of the other components.

### Q5.

a. Fixed Worload. No Overhead. The non-floating-point instructions arern't parallelizable. Divisibility.
b. Consistency of Benchmark Program. Multiple Tests and Averaging. Stable System Performance. No External Interference.

### Q6.

Most of the assumptions are listed in the question itself. A few that I could think of:

1. Strong Scaling: the parallelizable part scales linearly with the number of processors. In other words, the parallelizable should be distributable across N processors.
2. Fixed workload.
3. The proportion of the task that can be parallelized (80% in this case) is accurately known and remains constant.
4. All the other kinds of overhead are ignored.

**Part A:** The speedup calculation ignores any communication overhead between processors.

**Part B:** The communication overhead is fixed per processor. This overhead is cumulative and affects the overall speedup.

**Part C, D, and E:** The overhead is cumulative and affects the overall speedup.


