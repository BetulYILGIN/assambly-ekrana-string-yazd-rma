# Assembly Program: Key Press Detection and String Display

This project is an Assembly program that uses BIOS and DOS interrupts to detect a key press and display specific messages based on the input. The program checks for the key 'T' and displays corresponding text for matching and non-matching inputs.

---

## Features

- **Keyboard Input Detection:** Captures a key press using `int 16h`.
- **Conditional Comparison:** Compares the pressed key with the character 'T'.
- **Message Display:**
  - Displays "Gibtu" if 'T' is pressed.
  - Displays "Bilgisayar muhendisligi" for any other key.
- **Interrupt Usage:** Utilizes BIOS (`int 16h`) and DOS (`int 21h`) interrupts for functionality.

---

## How It Works

1. **Key Press Detection:**
   - The program waits for a key press using `int 16h`.
   - The key's ASCII value is stored in the `AL` register.

2. **Key Comparison:**
   - Compares the value in `AL` with the ASCII value of 'T'.
   - If the comparison is equal, it jumps to the label `yaz1`.
   - If not, it proceeds to `yaz2`.

3. **Message Display:**
   - `yaz1`: Displays the string "Gibtu" stored at the `gibtu` label.
   - `yaz2`: Displays the string "Bilgisayar muhendisligi" stored at the `yaz` label.

4. **Program Termination:**
   - After displaying the appropriate message, the program ends execution at the `done` label.

---

## Code Overview

### Assembly Code
```assembly
mov ah, 00h
int 16h

cmp al, 'T'
je yaz1


yaz2:
 mov ah, 09h
    mov dx, offset yaz
    int 21h
    jmp done


yaz1:
   mov ah, 09h
    mov dx, offset gibtu
    int 21h

done:  
yaz db 'Bilgisayar muhendisligi$', 0
gibtu db 'Gibtu$', 0
```

---

## Project Structure

```
.
├── program.asm      # Assembly source code
├── README.md        # Project documentation
```

---

## How to Run

1. **Install an Assembly Compiler/Emulator:**
   - Use an emulator like [DOSBox](https://www.dosbox.com/) or an assembler like [MASM](https://www.microsoft.com/en-us/download/details.aspx?id=12654) or [TASM].

2. **Assemble the Code:**
   ```bash
   masm program.asm
   link program.obj
   ```

3. **Run the Executable:**
   ```bash
   program.exe
   ```

4. **Interact with the Program:**
   - Press any key to see the output.
   - Press 'T' to display "Gibtu."
   - Press any other key to display "Bilgisayar muhendisligi."

---

## Example Output

### Input: 'T'
```
Gibtu
```

### Input: Any other key (e.g., 'A')
```
Bilgisayar muhendisligi
```

---

## Notes

- The `int 16h` interrupt is used for keyboard input.
- The `int 21h` interrupt with function `09h` is used to display strings.
- Strings must end with a `$` character for proper termination in `int 21h`.

---
