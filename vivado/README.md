# Vivado Introduction & Basic Workflow

This guide covers the fundamental steps to set up your first FPGA project for the Nexys A7.

## Overview
This tutorial follows the "Standard Design Flow":
1. **Project Creation:** Setting up the environment for Artix-7.
2. **Design Entry:** Creating VHDL/Verilog source files.
3. **Constraints:** Mapping signals to physical pins (.xdc).
4. **Implementation:** Synthesis, Place & Route, and Bitstream generation.
5. **Programming:** Uploading the `.bit` file to the hardware.

---

## 📂 Visual Guide
For a full step-by-step walkthrough with screenshots, please open the PDF guide:
👉 **[Download/View: Tutorial Vivado Intro.pdf](./Tutorial%20vidado%20intro.pdf)**

---

## Quick Hardware Reference
When prompted to select your part in Vivado (Slide 5), use these specs:
* **Family:** Artix-7
* **Package:** csg324
* **Speed:** -1
* **Part:** `xc7a100tcsg324-1` (Nexys A7-100T)

## Next Steps
Once you have mastered the workflow in this guide, head over to the **[Blinky Tutorial](../01_blinky/)** to write your first piece of HDL code.

---
**Author:** ProtoFPGA League  
**Date:** April 2026
