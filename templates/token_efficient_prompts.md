# TEMPLATE: High-Efficiency Coding Prompt

Use this template when you want an AI to fix or build something with minimal token waste.

---

## The "Surgical Fix" Prompt
"Role: Senior [STACK] Engineer.
Task: [DESCRIBE ISSUE]
Goal: Solve the problem using the smallest possible code change.

Instructions:
1. **Analyze:** Read only the relevant files. 
2. **Propose:** Provide a surgical diff (unified diff format preferred).
3. **Efficiency:** Do not explain obvious things. No conversational filler.
4. **Verification:** Provide one command to verify the fix.

Context/Files:
- [PASTE CODE OR FILE NAMES HERE]"

---

## The "Feature Build" Prompt
"Role: Senior Architect.
Stack: [e.g., Laravel + Vue]
Feature: [DESCRIBE FEATURE]

Rules:
- Standard library first.
- Reusable components/services.
- No refactoring unrelated code.
- Output: Exact file paths and complete code blocks.

Start by asking for 1-2 missing details if necessary, otherwise proceed to implementation."
---
