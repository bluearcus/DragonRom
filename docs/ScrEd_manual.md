# Screen Editor Manual

## Overview

The Screen Editor is a simple way to use existing on-screen content as a source of input.
It adds a new input mode to the console which lets you move around displayed text, pick characters to copy, and easily build or modify the command or basic program line you are inputting.

You can use it: 

- At any time while typing a command or program line
- When a BASIC program is requesting input using the INPUT command
- With the new `EDIT` command to quickly modify or create a new line based on an existing line

---

## Basic Screen Editor Operation

### Entering browse mode

While BASIC is waiting for input, press:

- `RIGHT` arrow → enter *browse mode*

---

### What browse mode does

- The standard input cursor is replaced by a new 'jumping' cursor to denote the mode change
- You can now control an independant *browse cursor* marked with an inverted character, initially this is in the same position as the input cursor
- You can move the browse cursor around the screen and copy text into your input line at the input cursor's position
- You can also type as normal directly into the input line while still in browse mode

---

### Moving around

Use the arrow keys:

- `UP`, `DOWN`, `LEFT`, `RIGHT` → move the browse cursor
- `SHIFT + DOWN` → return the browse cursor back 'home' to the input cursor position

---

### Editing actions

These keys affect the input line:

- `SHIFT + RIGHT` → copy the highlighted character at the browse cursor into the input line, and advance the browse cursor to the next character
- `SHIFT + LEFT` → delete the last character from the input line

---

### Leaving browse mode

- `CLEAR` → exit browse mode and return to normal input mode
- `ENTER` → accept the current input line
- `BREAK` → cancel the current input line

---

### Notes

- You cannot move past the current input cursor position
- If the screen scrolls, the editor keeps your browse cursor position consistent with any line you are copying, if it is still onscreen
- All standard keys and movement keys autorepeat in browse mode
- Some characters normally accessible from the arrow key group can not be accessed in browse mode. You can use `SHIFT` and `UP ARROW` to type the caret (up arrow) symbol without needing to leave browse mode, or temporarily exit browse mode using `CLEAR`, returning with `RIGHT` as necessary for other characters

---

## The `EDIT` Command

The `EDIT` command uses the screen editor browse mode to modify an existing BASIC line
It replaces the old line editor with the simpler and more intuitive screen-based editing method already described

---

### Syntax

```
EDIT <line-number>
```

---

### How it works

1. The screen is cleared
2. The specified line is displayed
3. The same line number is pre-entered for editing
4. Browse mode is entered, with the browse cursor positioned on the first statement character of the selected line

You can then: - Type normally, or

- Use browse mode to copy and modify text, or
- `CLEAR` to exit browse and carry on entering the line as standard
- re-enter browse mode if required at any time with `RIGHT` arrow

---

### Finishing

- `ENTER` → save the edited line
- `BREAK` → cancel

---

### Restrictions

- `EDIT` only works in **direct mode**
- Otherwise: an `?ID` error (Illegal Direct) is generated

