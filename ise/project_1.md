<div align="center">
  <img src="./images/logo.jpg" alt="Logo" width="150"/>
  <h3 align="center">Project 1</h3>
  <p align="center">Using the Xilinx ISIM Simulator</p>
  <p align="center">
    <a href="./project_files/project_1/">Project Files</a> |
    <a href="https://github.com/LigaProtoFPGA/docs/blob/main/setup-ise-vm.md">Previous Project</a> |
    <a href="./project_2.md">Next Project</a>
  </p>
</div>

---

<details>
<summary>Table of Contents</summary>
<ol>
  <li><a href="#prerequisites">Prerequisites</a></li>
  <li><a href="#creating">Creating the Project Files</a></li>
  <li><a href="#creating2">Creating a Project in ISE for Nexys 1 or Nexys 2 FPGA's</li>
  <li><a href="#using">Using the Xilinx ISIM Simulator</li>
  <li><a href="#mentors">Mentors</a></li>
</ol>
</details>

> [!IMPORTANT]
> This step-by-step is heavily based on the work of Professor Ney Laert Vilar Calazans, so all credits go to him.

---

### :fountain_pen: Prerequisites

1. Have ISE 14.7 VM installed and configured, if you don't have it, please go [here](https://github.com/LigaProtoFPGA/docs/blob/main/setup-ise-vm.md)

---

### :file_folder: Creating the Project Files

1. Create a working folder, named, for example, **halfadder**

2. In that folder, create two source files with **VHDL** extension and the contents of [these files](./project_files/project_1/)

---

### :computer: Creating a Project in ISE for Nexys 1 or Nexys 2 FPGA's

1. Open ISE and if a project opens on startup, close it in File then Close Project, as shown below:

<p align="center">
  <img src="./images/project_1/step1.png" alt="Step 1">
</p>

2. Create a new project named **haldadd** clicking on the button **New Project**, as shown below:

> [!WARNING]
> Choose a folder that you're sure you have permission to write.

<p align="center">
  <img src="./images/project_1/step2.png" alt="Step 2">
</p>

3. Fill the name field as shown below and click on **Next**:

> [!WARNING]
> Don't use special characters in the project name or path.

<p align="center">
  <img src="./images/project_1/step3.png" alt="Step 3">
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
  <img src="./images/project_1/step6.png" alt="Step 6">
</p>

---

### :fountain_pen: Using the Xilinx ISIM Simulator

1. In ISE, click with the right button on the FPGA icon in the **Hierarchy** window, and then **Add Copy of Source**, as shown below:

<p align="center">
  <img src="./images/project_1/step7.png" alt="Step 7">
</p>

2. Then add the two VHDL files created in previous steps, and click **OK**:

<p align="center">
  <img src="./images/project_1/step8.png" alt="Step 8">
</p>

> [!NOTE]
> Notice that ISE detected correctly the files, because **halfadd_tb.vhd** was marked as **Simulation** and **halfadd.vhd** as **All**, indicating that it contains synthesizable VHDL code.

3. In the **View** tab, choose **Simulation**:

<p align="center">
  <img src="./images/project_1/step9.png" alt="Step 9">
</p>

4. Select the **halfadd_tb.vhd** file in the **Hierarchy** window.

<p align="center">
  <img src="./images/project_1/step10.png" alt="Step 10">
</p>

5. Now in the **Processes** tab, do a double click in **Behavioral Check Syntax**, to verify if the testbench has any errors.

> [!IMPORTANT]
> Do the same for the **halfadd.vhd** file, clicking in the plus sign in the **Hierarchy** tab.

<p align="center">
  <img src="./images/project_1/step11.png" alt="Step 11">
</p>

6. To setup the simulation, select again the **halfadd_tb.vhd** file in the **Hierarchy** tab and then click with the right button in **Simulate Behavioral Model** in the **Process** tab, then change the **Property Display Level** to **Advanced** and the **Simulation Run Time** to **50 ns** and apply.

<p align="center">
  <img src="./images/project_1/step12.png" alt="Step 12">
</p>

7. To simulate, do a double click on **Simulate Behavioral Model** in the **Processes** tab, it should open a window similar to the shown in the image below. This is the **waveform** window that draws 50 nanoseconds of the circuit simulation.

> [!TIP]
> Adjust the waveform using the buttons indicated below.

<p align="center">
  <img src="./images/project_1/step13.png" alt="Step 13">
</p>

<p align="center">
  <strong>You've reached the end! <a href="project_2.md">Next Project</a></strong>
</p>

---

### :old_key: Mentors

<table border="0" cellspacing="0" cellpadding="10">
  <tr>
    <td>
      <a href="https://github.com/NeyCalazans">
        <img src="https://github.com/NeyCalazans.png?size=100" width="80" style="border-radius:50%">
      </a>
    </td>
    <td valign="middle">
      <strong>Prof. Ney Calazans</strong>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/adelfi172">
        <img src="https://github.com/adelfi172.png?size=100" width="80" style="border-radius:50%">
      </a>
    </td>
    <td valign="middle">
      <strong>Prof. Rodrigo Pereira</strong>
    </td>
  </tr>
</table>