# Parameterized-Ripple-Carry-Adder_Subtractor

## Overview
This project implements a **parameterized adder-subtractor module** in Verilog.  
It can perform both **addition** and **subtraction** using a single design with **two’s complement arithmetic**.

- Supports **variable bit-width**
- Uses **full adders (FA)** as building blocks
- Controlled by a single input `cin`:
  - `cin = 0` → Addition  
  - `cin = 1` → Subtraction  

---

## Module Description

### Module Name
`p_as`

### Inputs

| Signal | Width | Description |
|--------|-------|-------------|
| `a`    | `width` | First operand |
| `b`    | `width` | Second operand |
| `cin`  | 1       | Mode select (0 = add, 1 = subtract) |

### Outputs

| Signal | Width | Description |
|--------|-------|-------------|
| `sum`  | `width` | Result of operation |
| `cout` | 1       | Carry-out / Borrow indicator |

---

## Working Principle

### Addition (`cin = 0`)
- `b_inverse = b`

  ### Subtraction (`cin = 1`)
- `b` is inverted using XOR:
- `b_inverse = b ^ {width{1}}`

---

### Verification

<img width="364" height="173" alt="Screenshot 2026-03-21 at 9 24 31 PM" src="https://github.com/user-attachments/assets/bfb7472e-1305-498b-9517-884fd24230ee" />

### GTKwave Waveform

<img width="2660" height="802" alt="image" src="https://github.com/user-attachments/assets/560051d2-860e-4f33-848b-5b87b69e5f6c" />



