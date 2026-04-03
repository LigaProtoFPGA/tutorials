# Vivado Tutorial 2 — Prototyping on the Nexys A7

This guide covers the full FPGA prototyping workflow: from creating a project with a constraints file, running synthesis and implementation, generating the bitstream, and programming the Nexys A7 board.

> **Credits:** Based on original material by Prof. Dr. Ney Laert Vilar Calazans (UFSC).

---

## Prerequisites

- Vivado installed → [Installation guide](./setup-vivado.md)
- Tutorial 1 completed → [Project Setup and Simulation](./vivado_intro.md)
- Nexys A7 board connected via USB **before** turning on the computer
- Board powered via USB (Jumper JP3 set to USB)
- Board configured to receive bitstreams via JTAG (Jumper JP1)
- Board powered on

---

## 1. The circuit to prototype

Create a new Vivado project named `somador4` with the following VHDL file as the only synthesizable source. Do **not** include a testbench.

**somador4.vhd:**
```vhdl
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity somador is
port (A, B: in std_logic_vector(3 downto 0);
      Soma: out std_logic_vector(3 downto 0));
end somador;

architecture somador of somador is
begin
  Soma <= A + B;
end somador;
```

---

## 2. Mapping inputs and outputs to the board

The Nexys A7 has switches, LEDs, and other I/O connected to the FPGA pins. For this project, use:

| Signal       | Board resource       |
|--------------|----------------------|
| A (4 bits)   | Switches SW3 to SW0  |
| B (4 bits)   | Switches SW7 to SW4  |
| Soma (4 bits)| LEDs LD3 to LD0      |

This mapping is defined in a **constraints file** (`.xdc`), which tells Vivado which physical FPGA pins correspond to each signal in your VHDL code.

---

## 3. Setting up the constraints file

1. Download the Nexys A7 master constraints file:  
   [Nexys-A7-100T-Master.xdc](https://github.com/Digilent/digilent-xdc/blob/master/Nexys-A7-100T-Master.xdc)
2. Rename it to `Nexys-A7-100T-Master.xdc` if needed
3. In Vivado, go to the **Sources** panel → right-click `constrs_1` under **Constraints** → **Add Sources**
4. Choose **Add or create constraints** → **Next**
5. Click **Add Files**, navigate to the `.xdc` file and select it → **Finish**
6. Open the `.xdc` file in the Vivado text editor
7. The file has all pins commented out. Uncomment and edit only the lines corresponding to SW0–SW7, LD0–LD3, and rename the signals to match your VHDL port names (`A`, `B`, `Soma`)
8. Save the file

---

## 4. Running synthesis

1. In the **Flow Navigator**, close the **SIMULATION** and **RTL ANALYSIS** tabs — they are not needed here
2. In the **Sources** panel, select the `somador` entity under **Design Sources**
3. Click **Run Synthesis** in the **Flow Navigator**
4. Monitor progress in the **Project Summary** tab
5. When synthesis finishes, a pop-up will suggest running implementation — click **OK**

---

## 5. Running implementation

1. Implementation starts automatically after accepting the pop-up
2. Monitor progress in the **Project Summary** tab
3. When it finishes, a pop-up will suggest opening the implemented design — click **OK**

---

## 6. Analyzing the implemented design

In the **IMPLEMENTED DESIGN** view you can explore the result:

**Schematic view:**
- Open the **Schematic** tab in the top-right panel
- You will see statistics at the top: number of cells, I/O ports, and nets
- Yellow boxes = logic cells (LUTs), green lines = wires, thick green lines = buses

**Device view:**
- Click on any cell in the schematic (e.g. a LUT4)
- Switch to the **Device** tab to see where that element sits physically on the FPGA chip
- White squares = selected element, white lines = routing paths

---

## 7. Generating the bitstream

1. In the **Flow Navigator**, click **Generate Bitstream** under **PROGRAM AND DEBUG**
2. When it finishes, choose **Open Hardware Manager** in the pop-up

---

## 8. Programming the board

1. In the **Hardware Manager**, check the **Hardware** panel (top left) — the Nexys A7 should appear as `xc7a100t_0`
2. Select the device
3. Click **Program Device** in the **Flow Navigator** under **PROGRAM AND DEBUG**
4. The yellow "done" LED on the board should light up

---

## 9. Testing the circuit

After programming, test the adder directly on the board:

- Switches **SW3–SW0** control input **A**
- Switches **SW7–SW4** control input **B**
- LEDs **LD3–LD0** show the **sum**

Switch down = 0, switch up = 1. LED off = 0, LED on = 1.

**Example:** A = 0010 (SW1 up), B = 0011 (SW4 and SW5 up) → Soma = 0101 (LD0 and LD2 on). In decimal: 2 + 3 = 5. ✓

---

**League:** ProtoFPGA — UFSC  
**Credits:** Prof. Dr. Ney Laert Vilar Calazans (UFSC)
