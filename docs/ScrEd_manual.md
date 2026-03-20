# Screen Editor Manual

## Overview

The Screen Editor is a simple way to use existing on-screen content as a source of input.
It lets you move around displayed text, pick characters, and build or
modify a command or line interactively.

You can use it: 

- At any time while typing a command or program line

- When a BASIC program is requesting input using the INPUT command

- With the new `EDIT` command to modify or create a new line based on an existing line

------------------------------------------------------------------------

## Basic Screen Editor Operation

### Entering browse mode

While BASIC is waiting for input, press:

- **Right Arrow** → enter *browse mode*

------------------------------------------------------------------------

### What browse mode does

- The standard input cursor is replaced by an inverse alternating forward and backslash to denote the mode change
- You can now control an independant *browse cursor* marked as an inverted character, initially in the same position as the input cursor
- You can move the *browse cursor* around the screen and copy text into your input line at the input cursor's position
- You can also type as normal directly into the input line while still in browse mode

------------------------------------------------------------------------

### Moving around

Use the arrow keys:

- `UP`, `DOWN`, `LEFT`, `RIGHT` → move the browse cursor

------------------------------------------------------------------------

### Editing actions

These keys affect the input line:

- `SHIFT + RIGHT` → copy highlighted character into the input line\
- `SHIFT + LEFT` → backspace in the input line\
- `SHIFT + DOWN` → return 'home' to the current input cursor position

------------------------------------------------------------------------

### Leaving browse mode

- `CLEAR` → return to normal typing\
- `ENTER` → accept the line\
- `BREAK` → cancel the line

------------------------------------------------------------------------

### Notes

- You cannot move past the current input cursor position
- If the screen scrolls, the editor keeps your browse cursor position consistent with any line you are copying, if it is still onscreen
- All standard keys and movement keys autorepeat in browse mode.
- Some characters normally accessible from the arrow key group can not be accessed in browse mode. You can use `SHIFT` and `UP ARROW` type the caret symbol without needing to leave browse mode, or temporarily exit browse mode using `CLEAR`, returning with `RIGHT` as necessary.

------------------------------------------------------------------------

## The `EDIT` Command

The `EDIT` command simply uses the screen editor to modify an existing
BASIC line.\
It replaces the older line editor with the same screen-based editing
method.

------------------------------------------------------------------------

### Syntax

    EDIT <line-number>

------------------------------------------------------------------------

### How it works

1. The screen is cleared\
2. The specified line is displayed\
3. The same line number is pre-entered for editing
4. Browse mode is selected, and the browse cursor is positioned on the first statement character of the displayed line

You can then: - Type normally, or\

- Use browse mode to copy and modify text, or
- `CLEAR` to exit browse and carry on entering the line as standard

------------------------------------------------------------------------

### Finishing

- `ENTER` → save the edited line\
- `BREAK` → cancel

------------------------------------------------------------------------

### Restrictions

- `EDIT` only works in **direct mode**\
- Otherwise: `?ID` (Illegal Direct)
