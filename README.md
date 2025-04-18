# LEX & YACC Scientific Calculator 🧮

This is a simple scientific calculator built using `LEX` (Flex) and `YACC` (Bison) tools on Windows. It supports various operations like addition, subtraction, multiplication, division, powers, and more.

## 🛠️ Requirements

Make sure you have the following tools installed:

- `win_flex` (Flex for Windows)
- `win_bison` (Bison for Windows)
- `GCC` compiler (MinGW or similar)

## ⚙️ How to Run

Step-by-step commands:

```bash
win_bison -d calculator.y         # Generates calculator.tab.c and calculator.tab.h
win_flex calculator.l             # Generates lex.yy.c
gcc calculator.tab.c lex.yy.c -o scicalc.exe -lm
.\scicalc.exe                     # Run the calculator
