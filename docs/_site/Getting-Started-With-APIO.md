# Lab Setup Guide: Verilog Development with VS Code & Apio

Welcome to Digital Logic Design! In this course, we use **Visual Studio Code (VS Code)** paired with **Apio** to write, verify, and simulate Verilog code. 

This setup runs natively on **Windows, macOS (including M1/M2/M3 Apple Silicon), and Linux**. It matches our course autograder exactly, meaning if your code compiles and simulates correctly on your laptop, it will behave the same way when graded.

---

## 🛠️ Step 1: Install Visual Studio Code
If you do not already have it, download and install VS Code for your operating system:
* **Download Link**: [https://visualstudio.com](https://visualstudio.com)

---

## 📦 Step 2: Install Python
Apio relies on Python to manage its backend tools. 
1. **Download Link**: [https://python.org](https://python.org) (Download the latest stable version).
2. **CRITICAL STEP FOR WINDOWS USERS**: During the installation wizard, you **MUST** check the box that says **"Add python.exe to PATH"** before clicking install. If you miss this, Apio will not work.

---

## ⚙️ Step 3: Install Apio and Toolchains
We will install Apio and its required compilers (`iverilog` and `GTKWave`) directly inside VS Code.

1. Open **VS Code**.
2. Click on the **Extensions** icon on the left sidebar (or press `Ctrl+Shift+X` on Windows, `Cmd+Shift+X` on Mac).
3. Search for **"Apio"** (by fpgawars) and click **Install**.
4. Once installed, look at the bottom status bar or open the command palette (`Ctrl+Shift+P` or `Cmd+Shift+P`).
5. Run the following command to download the compiler and simulator toolchains:
   ```bash
   apio install --all
   ```
   *Note: This download may take a few minutes. A success message will appear in your terminal when finished.*

---

## 🚀 Step 4: Your First Simulation (Quick Test)

To make sure everything is installed correctly, let's create a simple AND gate logic module and test it.

### 1. Create a Project Folder
Create a brand new, empty folder on your computer named `and_gate_test`. Open this folder in VS Code (`File` -> `Open Folder`).

### 2. Write the Logic Hardware (`and_gate.v`)
Create a new file named `and_gate.v` and paste the following code:
```verilog
module and_gate(
    input a,
    input b,
    output y
);
    assign y = a & b;
endmodule
```

### 3. Write the Simulation Testbench (`and_gate_tb.v`)
Create a second file named `and_gate_tb.v`. This file tells the simulator what inputs to inject so you can watch the output change. Paste this code:
```verilog
`timescale 1ns/1ns

module and_gate_tb;
    reg a, b;
    wire y;

    // Instantiate our design under test (DUT)
    and_gate uut (.a(a), .b(b), .y(y));

    initial begin
        // CRITICAL: This line generate the waveform file for GTKWave
        $dumpvars(0, and_gate_tb);

        // Test all combinations of inputs
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish; // End simulation
    end
endmodule
```

### 4. Run the Verification & Simulation
Open the VS Code built-in terminal (`Terminal` -> `New Terminal`) and run these two commands:

* **Create an ini file (we will change this step later in the course):**
  ```bash
  apio create --board icestick
  ```

* **To check for syntax errors:**
  ```bash
  apio lint
  ```
* **To run the simulation and view waveforms:**
  ```bash
  apio sim
  ```

If successful, **GTKWave** will automatically pop open on your screen! 

---

## 📈 Step 5: Viewing Your Waveforms in GTKWave
When GTKWave opens, it will look blank at first. Follow these quick steps to see your signals:
1. In the top-left **SST** panel, click on `and_gate_tb`.
2. In the panel below it, you will see your signals: `a`, `b`, and `y`.
<!--3. Select all three signals (hold `Ctrl` or `Cmd` to click multiple), then click the **Append** button at the bottom left. -->
3. Click the **Zoom Fit** icon (magnifying glass with an "all" box) in the top toolbar to see your complete timing diagram!

---

## 🛑 Common Troubleshooting
* **Error: "apio command not found"**: Restart VS Code completely. If it still fails, your Python installation was not added to your system PATH. Re-run the Python installer and ensure the "Add to PATH" checkbox is clicked.
* **GTKWave opens but is completely empty**: Make sure your `_tb.v` file contains the exact `$dumpfile` and `$dumpvars` lines shown in the example above. Without them, no waveform data is saved for GTKWave to display.
