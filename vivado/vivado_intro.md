# Vivado Tutorial 1 — Project Setup and Simulation

This guide walks through creating your first Vivado project for the Nexys A7 board, adding source files, and running behavioral simulations. It covers three progressively more complex exercises.

> **Credits:** Based on original material by Prof. Dr. Ney Laert Vilar Calazans (UFSC).

---

## Prerequisites

- Vivado installed on your machine → [Installation guide](../instalacao_vivado.md)
- Board files for the Nexys A7 installed

---

## Part 1 — Half Adder (1 bit)

### 1. Creating the source files

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

### 2. Creating a new project in Vivado

1. Open Vivado from the Start menu
2. If a project is already open, close it: **File → Close Project**
3. Click **Create Project** on the home screen and click **Next**

---

### 3. Naming and locating the project

1. Fill in **Project name** (e.g. `somador1`) and **Project location**
   > ⚠️ Do not use special characters, accents, or spaces in the project name or path
2. Make sure **Create project subdirectory** is checked
3. Click **Next**

---

### 4. Selecting the project type

1. Choose **RTL Project**
2. Check **Do not specify sources at this time**
3. Click **Next**

---

### 5. Selecting the FPGA device

Use the following filters to find the Nexys A7 chip:

| Field    | Value           |
|----------|-----------------|
| Category | General Purpose |
| Family   | Artix-7         |
| Package  | csg324          |
| Speed    | -1              |

Select the device that appears, click **Next**, review the **New Project Summary** and click **Finish**.

---

### 6. Adding source files

1. In the **Sources** panel, click the **+** button
2. Choose **Add or create design sources** → **Next**
3. Click **Add Files**, navigate to your directory and select both `.vhd` files
4. Click **OK** → **Finish**

---

### 7. Configuring the simulation time

1. In the **Sources** panel, find `halfadd_tb` under **Simulation Sources → sim_1** and select it
2. In the **Flow Navigator**, right-click **Run Simulation** under **SIMULATION**
3. Choose **Simulation Settings**
4. Go to the **Simulation** tab and find `xsim.simulate.runtime`
5. Change the value to `50ns` → click **Apply** and **OK**

---

### 8. Running the simulation

1. In the **Flow Navigator**, click **Run Simulation** (left mouse button)
2. Choose **Run Behavioral Simulation**
3. Click the **Zoom Fit** button (four diagonal arrows icon) to see the full waveform

> ⚠️ Make sure you are simulating the **testbench** (`halfadd_tb`), not the circuit itself.

**Expected result:**

| aa | bb | soma | vaium |
|----|----|------|-------|
| 0  | 0  | 0    | 0     |
| 1  | 0  | 1    | 0     |
| 0  | 1  | 1    | 0     |
| 1  | 1  | 0    | 1     |

---

## Part 2 — 4-bit Adder

This exercise expands the half adder into a 4-bit adder using `std_logic_vector` instead of single-bit `std_logic`.

> Tip: Use **File → Save Project As** in Vivado to copy the previous project as a starting point.

### Circuit

**soma.vhd:**
```vhdl
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity soma is
port (A, B: in std_logic_vector(3 downto 0);
      Soma: out std_logic_vector(3 downto 0));
end soma;

architecture comp of soma is
begin
  Soma <= A + B;
end comp;
```

> Note: `std_logic` = 1 wire. `std_logic_vector` = a bus (1 or more wires). The `std_logic_unsigned` library is required to allow arithmetic operations on vectors.

### Testbench

4-bit values can be represented as a single hex digit. In the testbench you can write:

```vhdl
aa <= x"9", x"5" after 10 ns, x"A" after 20 ns, x"B" after 30 ns;
bb <= x"8", x"3" after 20 ns;
```

To test all 256 input combinations automatically, use this stimulus generator in the testbench:

```vhdl
signal aa : std_logic_vector(3 downto 0) := "0000";
signal bb : std_logic_vector(3 downto 0) := "0000";
...
process (aa)
begin
  if (aa /= x"F") then
    aa <= aa + x"1" after 10 ns;
  else aa <= x"0" after 10 ns;
  end if;
end process;

process (bb)
begin
  if (bb /= x"F") then
    bb <= bb + x"1" after 160 ns;
  else bb <= x"0" after 160 ns;
  end if;
end process;
```

> After simulating, check every combination manually — does the output always match what you expect? Pay attention to overflow cases.

---

## Part 3 — D Flip-Flop (Master-Slave)

This exercise implements a rising-edge triggered D flip-flop with asynchronous preset (PRE) and clear (CLR) signals — equivalent to half of a TTL 7474 IC.

**Circuit behavior:**
- PRE = 0 forces Q = 1 (and Q_n = 0), regardless of the clock
- CLR = 0 forces Q = 0 (and Q_n = 1), regardless of the clock
- PRE and CLR must never be 0 at the same time
- On each rising edge of CLK (with PRE and CLR inactive), Q samples the value of D

> ⚠️ Do not use the `process` statement in VHDL for this exercise — the description must reflect the structural diagram of the circuit, not just its behavior.

### Entity

```vhdl
entity ffd is
port (
  D, CLK   : in  std_logic;
  PRE, CLR : in  std_logic;  -- active low, use _n convention
  Q, Q_n   : out std_logic
);
end ffd;
```

### Three architectures required

You must write **three different architectures** for the same entity, each describing the circuit at a different level of structural hierarchy:

**Architecture 1 — Flat**
Describe each of the 6 NAND3 gates directly, one per line of VHDL code. Declare internal wires as signals. Since output ports Q and Q_n are used as inputs to other gates, use intermediate signals instead of using output ports directly as inputs.

**Architecture 2 — Using a NAND3 component**
Define a `nand3i` entity/architecture pair and instantiate it 6 times using `port map`.

**Architecture 3 — Using a latch component**
Identify the 3 pairs of cross-coupled NAND3 gates (each pair forms a latch). Define a latch with 4 inputs and 2 outputs as an entity/architecture pair, and instantiate it 3 times using `port map`.

### Testbench tips

When writing the testbench, respect synchronous circuit timing rules:

- When CLK transitions (0 → 1), **no sampled signal** (D, CLR, PRE) should change at the same time — remember setup and hold time constraints
- CLR and PRE are active low — use the `_n` suffix convention (e.g. `clr_n`, `pre_n`)
- Signal names in the testbench can match port names — just be consistent

To simulate all three architectures that share a single entity, study and use the VHDL **configuration** construct.

---

**League:** ProtoFPGA — UFSC
**Credits:** Prof. Dr. Ney Laert Vilar Calazans (UFSC)
