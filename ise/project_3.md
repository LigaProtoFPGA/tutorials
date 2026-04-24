<div align="center">
  <img src="./images/logo.jpg" alt="Logo" width="150"/>
  <h3 align="center">Project 3</h3>
  <p align="center">Making a D-type flip-flop sensitive to the rising edge of the clock</p>
  <p align="center">
    <a href="./project_files/project_3/">Project Files</a> |
    <a href="./project_2.md">Previous Project</a> |
    <a href="./project_4.md">Next Project</a>
  </p>
</div>

---

<details>
<summary>Table of Contents</summary>
<ol>
  <li><a href="#prerequisites">Prerequisites</a></li>
  <li><a href="#mentors">Mentors</a></li>
</ol>
</details>

> [!IMPORTANT]
> This step-by-step is heavily based on the work of Professor Ney Laert Vilar Calazans, so all credits go to him.

---

### :fountain_pen: Prerequisites

1. Have ISE 14.7 VM installed and configured, if you don't have it, please go [here](https://github.com/LigaProtoFPGA/docs/blob/main/setup-ise-vm.md)
2. Have completed the [previous project](./project_2.md)

---

### :computer: Creating a Project in ISE for Nexys 1 or Nexys 2 FPGA's

1. Open ISE and if a project opens on startup, close it in File then Close Project, as shown below:

<p align="center">
  <img src="./images/project_1/step1.png" alt="Step 1">
</p>

2. Create a new project named **flip_D** clicking on the button **New Project**, as shown below:

> [!WARNING]
> Choose a folder that you're sure you have permission to write.

<p align="center">
  <img src="./images/project_1/step2.png" alt="Step 2">
</p>

3. Fill the name field as shown below and click on **Next**:

> [!WARNING]
> Don't use special characters in the project name or path.

<p align="center">
  <img src="./images/project_3/step3.png" alt="Step 3">
</p>

4. Change the fields according to the board you're using:

For **Nexys 2** with size **1200**:

> [!WARNING]
> If you're using a device with size **500**, choose **XC3S500E** instead.

<p align="center">
  <img src="./images/project_1/step4.png" alt="Step 4">
</p>

For **Nexys 1**:

<p align="center">
  <img src="./images/project_1/step5.png" alt="Step 5">
</p>

5. In the final window, check everything and then click on finish, as shown below:

<p align="center">
  <img src="./images/project_3/step6.png" alt="Step 6">
</p>

---

### :gear: Making a D-type flip-flop sensitive to the rising edge of the clock

<p align="center">
  <img src="./images/project_3/flip_D_diagram.png" alt="D-type flip flop diagram">
</p>

To make a D-type flip-flop sensitive to the rising edge of the clock, there are 3 possible options of implementation. First, using direct logic, by simply connecting wires. Second, it is possible to subdivide the structure, making an entity for the 3-input NANDs:

<p align="center">
  <img src="./images/project_3/flip_D_nand3.png" alt="D-type flip flop NAND3 implementation">
</p>

And lastly, by subdiving it in 4-input latches:

<p align="center">
  <img src="./images/project_3/flip_D_latch4.png" alt="D-type flip flop Latch implementation">
</p>
