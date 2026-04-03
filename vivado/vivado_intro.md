# Vivado Tutorial 1 — Project Setup and Simulation

This guide walks through creating your first Vivado project for the Nexys A7 board, adding source files, and running a behavioral simulation.

> **Credits:** Based on original material by Prof. Dr. Ney Laert Vilar Calazans (UFSC).

---

## Prerequisites

- Vivado installed on your machine
- Board files for the Nexys A7 installed

---

## 1. Creating the source files

Create a working directory (e.g. `half_adder`) and inside it create two `.vhd` files.

**somador1.vhd** — the circuit:
```vhdl
library IEEE;
use IEEE.std_logic_1164.all;

entity halfadd is
port (A, B: in std_logic;
      Sum, Carry: out std_logic);
end halfadd;

architecture comp of halfadd is
begin
  Sum   <= A xor B;
  Carry <= A and B;
end comp;
```

**somador1_tb.vhd** — the testbench:
```vhdl
library IEEE;
use IEEE.std_logic_1164.all;

entity halfadd_tb is
end halfadd_tb;

architecture TB_ARCHITECTURE of halfadd_tb is
  signal aa, bb, soma, vaium : std_logic;
begin

  UUT : entity work.halfadd
        port map ( A => aa, B => bb,
                   Sum => soma, Carry => vaium );

  aa <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns;
  bb <= '0', '1' after 20 ns;

end TB_ARCHITECTURE;
```

---

## 2. Creating a new project in Vivado

1. Open Vivado from the Start menu
2. If a project is already open, close it: **File → Close Project**
3. Click **Create Project** on the home screen
4. Read the welcome screen and click **Next**

---

## 3. Naming and locating the project

1. Fill in **Project name** (e.g. `somador1`) and **Project location**
   > ⚠️ Do not use special characters, accents, or spaces in the project name or path
2. Make sure **Create project subdirectory** is checked
3. Click **Next**

---

## 4. Selecting the project type

1. Choose **RTL Project**
2. Check **Do not specify sources at this time**
3. Click **Next**

---

## 5. Selecting the FPGA device

Use the following filters to find the Nexys A7 chip:

| Field    | Value           |
|----------|-----------------|
| Category | General Purpose |
| Family   | Artix-7         |
| Package  | csg324          |
| Speed    | -1              |

Select the device that appears and click **Next**. Review the **New Project Summary** and click **Finish**.

---

## 6. Adding source files

1. In the **Sources** panel, click the **+** button
2. Choose **Add or create design sources** → **Next**
3. Click **Add Files**
4. Navigate to your directory and select both `somador1.vhd` and `somador1_tb.vhd`
5. Click **OK** → **Finish**

---

## 7. Configuring the simulation time

1. In the **Sources** panel, find `halfadd_tb` under **Simulation Sources → sim_1** and select it
2. In the **Flow Navigator**, right-click **Run Simulation** under **SIMULATION**
3. Choose **Simulation Settings**
4. In the settings window, go to **Simulation** tab
5. Find the line `xsim.simulate.runtime` and change the value to `50ns`
6. Click **Apply** and **OK**

---

## 8. Running the simulation

1. In the **Flow Navigator**, click **Run Simulation** (left mouse button this time)
2. In the pop-up, choose **Run Behavioral Simulation**
3. To see the complete waveform, click the **Zoom Fit** button (four diagonal arrows icon)

The waveform should display all four input combinations of the half adder truth table.

> ⚠️ Make sure you are simulating the **testbench** (`halfadd_tb`), not the circuit itself. The testbench must be at the top of the hierarchy in the Sources panel.

---

## Expected result

The simulation waveform should show:

| aa | bb | soma | vaium |
|----|----|------|-------|
| 0  | 0  | 0    | 0     |
| 1  | 0  | 1    | 0     |
| 0  | 1  | 1    | 0     |
| 1  | 1  | 0    | 1     |

If the output matches, your simulation environment is working correctly.

---

**League:** ProtoFPGA — UFSC  
**Credits:** Prof. Dr. Ney Laert Vilar Calazans (UFSC)
