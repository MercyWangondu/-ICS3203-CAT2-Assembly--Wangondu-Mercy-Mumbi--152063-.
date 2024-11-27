# -ICS3203-CAT2-Assembly--Wangondu-Mercy-Mumbi--152063-.
This repository contains the solutions to the CAT 2 Assembly Programming tasks for ICS3203. The tasks demonstrate core assembly programming concepts such as control flow, array manipulation, modular programming, and data monitoring.


## Task 1: Control Flow and Conditional Logic
### Purpose
This program prompts the user to input a single-digit number and classifies it as **POSITIVE**, **NEGATIVE**, or **ZERO**. It uses conditional and unconditional jumps to control the program flow effectively.

### How to Assemble and Run
1. **Assemble the Code**:
   ```bash
   nasm -f elf32 -o control_flow.o control_flow.asm

2. **Link the Object File**:
   ```bash
   ld -m elf_i386 -o control_flow control_flow.o

3. **Run the Program**:
   ```bash
   ./control_flow
4. **Number Input**:
User enters an integer (e.g. 50,-970) and the program will classify and print whether the number is positive, negative, or zero.

### Example Input and Output
1. Input: 5

Output: The number is POSITIVE

2. Input: 0

Output: The number is ZERO

3. Input: -3

Output: The number is NEGATIVE

### Challenges and Insights 

**Key Learnings:**

- Understanding Conditional and Unconditional Jumps
- ASCII to Integer Conversion
- Working with Registers
- Importance of Program Structure

**Insights:**

- je ensures the program correctly jumps to the "zero" case.

- Using jmp after each case prevents unintended code execution.
**Challenges:**

1. Converting user input from ASCII to integer format.

2. Handling edge cases like invalid or multiple inputs.
3. Managing conditional and unconditional jumps effectively to ensure a clear program flow.




### Commentary on Jumps:

1. **je (Jump if Equal):** Used to handle the case where the input is zero. This ensures program flow branches only if the comparison result is equal to zero.
2. **jl (Jump if Less):** Redirects flow to handle negative numbers, ensuring positive numbers are skipped.
3. **jmp (Unconditional Jump):** Used to direct program flow to the exit point after a specific condition is handled, avoiding unintended execution of subsequent cases.

## Task 2: Array Manipulation
### Purpose
This program reverses an array of integers in place using two pointers. It demonstrates efficient use of memory by avoiding the creation of additional arrays.

### How to Assemble and Run
1. **Assemble the Code**:
   ```bash
   nasm -f elf32 -o array_reverse.o array_reverse.asm

2. **Link the Object File**:
   ```bash 
   ld -m elf_i386 -o array_reverse array_reverse.o

3. **Run the Program**:
   ```bash
    ./array_reverse

4. **Array Input**
**NOTE:** The user enters 5 single-digit numbers one at a time.
- The program accepts an array of 5 single-digit integers from the user(e.g., [7, 8, 9, 10, 11]).
- After execution, it outputs the reversed array to memory, which can be observed using a debugger or by modifying the program to display the result.


### Example Input and Output
Input: [1, 2, 3, 4, 5] → Output: [5, 4, 3, 2, 1]

### Challenges and Insights

**Key Learnings:**

- Pointer arithmetic is crucial for efficient array manipulation in assembly language.
- In-place reversal avoids memory overhead, making the program more efficient.
**Insights:**

- This task demonstrated how in-place operations can be performed using two pointers. No extra memory was required, which is an efficient way to manipulate arrays.
- Understanding the mechanics of loops and pointer adjustments is key to working with arrays in assembly.


 **Challenges:**

  1. Ensuring proper pointer updates during the   reversal process.
2. Handling edge cases like arrays with a single element or empty arrays.
3. Properly managing memory when swapping array elements.


### Commentary on Jumps:

1. **jge (Jump if Greater or Equal):** Ensures the loop exits when the pointers overlap or cross, indicating the array has been fully reversed.
2. **jmp (Unconditional Jump):** Used to repeatedly execute the reversal logic until the stopping condition is met.

## Task 3: Factorial Calculation
### Purpose
This program calculates the factorial of a number using a modular approach. A subroutine is used to perform the calculation, and the stack is utilized for register management to preserve program state.

### How to Assemble and Run
1. **Assemble the Code**:
   ```bash
   nasm -f elf32 -o factorial_subroutine.o factorial_subroutine.asm

2. **Link the Object File**:
   ```bash 
   ld -m elf_i386 -o factorial_subroutine factorial_subroutine.o

3. **Run the Program**:
   ```bash
   ./factorial_subroutine

4. **Number Input**
- The program calculates the factorial of a number inputed by the user (e.g., 5) in the code.
- The result is stored in memory and can be printed by extending the program or using a debugger.

### Example Input and Output
- Input: 5 ->Output: Factorial: 120

- Input: 3 -> Output: Factorial: 6

### Challenges and Insights


**Insights:**

- The modular approach, using subroutines, emphasized the importance of managing registers and using the stack. This approach makes the code reusable and organized.
- Factorial calculations in assembly illustrate the need for careful handling of loop counters and registers.

**Challenges:**

1. Correctly preserving and restoring register values using the stack.
2. Avoiding infinite loops by implementing a proper termination condition.
3. Managing registers during the factorial calculation.


**Key Learnings:**

- Using the stack to save and restore registers is essential for modular programming.
- Subroutines simplify complex operations, improving program structure and readability.

### Commentary on Jumps:

1. **jle (Jump if Less or Equal):** Ensures the loop terminates when the factorial computation is complete.
2. **jmp (Unconditional Jump):** Used to return to the start of the loop until the stopping condition is met.

## Task 4: Data Monitoring Simulation
### Purpose
This program simulates a sensor-based monitoring system. Based on a sensor value, it performs actions such as turning a motor on/off or triggering an alarm. Memory locations represent the sensor, motor, and alarm states.


### How to Assemble and Run
1. **Assemble the Code**:
   ```bash
   nasm -f elf32 -o data_monitoring.o data_monitoring.asm

2. **Link the Object File**:
   ```bash 
   ld -m elf_i386 -o data_monitoring data_monitoring.o

3. **Run the Program**:
   ```bash
   ./data_monitoring

4. **Number Input**
- The program uses a predefined sensor_value in the code (e.g., 70).
- Based on this value and the users input:
- If sensor_value > 50: Motor is turned ON, and alarm is triggered.
- If 30 < sensor_value <= 50: Motor and alarm are both OFF.
- If sensor_value <= 30: Motor and alarm remain OFF.
- Outputs are stored in memory and can be printed or observed using a debugger.

### Example Input and Output
- Input: 70->Output: Motor: ON, Alarm: TRIGGERED
- Input: 35->Output: Motor: OFF, Alarm: RESET
- Input: 25->Output: Motor: OFF, Alarm: RESET

### Challenges and Insights

**Key Learnings:**
- Assembly programming is closely tied to hardware-level operations.
- Simulating real-world scenarios, such as motor control, reinforces understanding of low-level programming.

**Insights:**

This task provided insight into hardware-level programming concepts like simulating ports and memory-mapped I/O. It was a good exercise in using conditional logic for system-level decisions.

**Challenges:**

1. Mapping sensor values to specific actions using logical conditions.
2. Ensuring that the motor and alarm states are updated correctly based on input.
3. Simulating hardware states with memory-mapped I/O.

### Commentary on Jumps:

1. **jg (Jump if Greater):** Directs the program to appropriate cases (high or moderate levels) based on sensor value.
2. **jmp (Unconditional Jump):** Ensures no unintended code execution after a case is handled.


