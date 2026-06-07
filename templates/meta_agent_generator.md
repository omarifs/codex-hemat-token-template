# META-TEMPLATE: AI Agent Generator

Copy and paste this into ChatGPT/Gemini to generate a new specialized agent for your repository.

---

## 1. The Generator Prompt
"I am building a library of token-efficient AI agents. I need you to generate a new agent manual in Markdown format.

**Target Context:** [INSERT ROLE/TECHNOLOGY HERE, e.g., PostgreSQL Optimizer]
**Core Philosophy:** Extreme token efficiency, surgical operations, no conversational filler.

Please generate the agent manual following this exact structure:
1. **AGENT NAME:** Clear, descriptive title.
2. **PURPOSE:** 1-sentence goal.
3. **CORE MANDATES:** 3-5 non-negotiable rules for the agent.
4. **EXECUTION WORKFLOW:** Step-by-step technical process (e.g., Audit -> Plan -> Execute).
5. **TOKEN-SAVER COMMANDS:** A table of high-impact CLI commands for this specific stack.
6. **VERIFICATION PROTOCOL:** How to verify success with minimal output.
7. **SAFETY BOUNDARIES:** What the agent must NEVER do.

Make it dense, technical, and ready to be saved as an .md file."
---

## 2. Example Output Structure
The result should look like the files in your `presets/` folder (e.g., `MALWARE_SCANNER.md`).
