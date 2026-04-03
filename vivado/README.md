# Vivado Step-by-Step Guides

This folder contains the essential visual guides for mastering the Xilinx Vivado toolchain with the Nexys A7 board.

---

## 1. Project Setup (Introduction)
**File:** [Tutorial_vivado_intro.pdf](./vivado_intro.md)

Focuses on the initial steps:
* Creating a new project.
* Selecting the correct FPGA part (**xc7a100tcsg324-1**).
* Adding source files and constraints (.xdc).

---

## 2. Complete Workflow (Synthesis to Programming)
**File:** [Tutorial_vivado_workflow.pdf](./Tutorial_vivado_workflow.pdf)

Covers the full hardware logic flow:
1. **RTL Analysis:** Checking your logic schematic.
2. **Synthesis & Implementation:** Converting code to physical gates and routing.
3. **Power & Timing:** Analyzing hardware constraints and resource utilization.
4. **Bitstream Generation:** Creating the `.bit` file.
5. **Hardware Manager:** Programming the FPGA and verifying the result.

---

## How to use these guides
1. Open the PDF directly here on GitHub to follow the screenshots.
2. Ensure your board is connected via USB before starting the **Hardware Manager** steps.
3. If you encounter "Timing constraints" errors, double-check your `.xdc` file.

---
**Mentors:** Prof. Ney & Prof. Rodrigo  
**League:** ProtoFPGA (UFSC)
