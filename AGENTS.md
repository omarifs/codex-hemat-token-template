# AGENTS.md

## Purpose
This repository stores reusable prompt templates and operating rules for coding agents.
Optimize for low token use, small safe changes, and practical verification.

## Specialized Agents
- **[Server Deployer](presets/SERVER_DEPLOYER.md):** High-performance server deployment and optimization workflow.
- **[Malware Scanner](presets/MALWARE_SCANNER.md):** Automated threat detection and security hardening.

## Core Rules
- Focus only on the requested task.
- Read only files that are likely relevant.
- Prefer the smallest change that solves the problem.
- Do not refactor broadly unless explicitly asked.
- Do not add dependencies unless they are clearly required.
- Preserve unrelated user changes. Never revert work you did not make.
- Use ASCII by default.

## Working Style
- Start with a short repo scan, then narrow down to the exact files involved.
- If the task is ambiguous, make the safest reasonable assumption and state it briefly.
- When editing, prefer `apply_patch` and keep diffs tight.
- If the task can be solved by a direct fix, do that instead of exploring alternatives.
- If multiple files are involved, update only the ones needed for the fix.
- Prefer template reuse over inventing new formats.

## Stack-Aware Verification
- Detect the target project stack from the repository files before choosing commands.
- If `composer.json` or `artisan` exists, prefer Laravel/PHP checks such as `php artisan`, `vendor/bin/pest`, or `vendor/bin/phpunit`.
- If `package.json` exists, prefer Node.js checks such as `npm`, `pnpm`, or `yarn` scripts, plus targeted lint/test/build commands.
- If both stacks exist, verify only the part that matches the change.
- Prefer the lightest verification that gives real confidence.
- Verify the happy path and the specific bug or risk being addressed.
- If verification cannot be run, state that clearly and explain the limitation briefly.

## Prompting Efficiency
- Avoid long explanations unless the user asks for them.
- Avoid reading unrelated files or running broad commands.
- Ask only when a missing detail blocks safe progress.
- When the fix is clear, implement first and report after.
- Keep outputs short and structured.

## Output Format
- `Changed Files:`
- `What Changed:`
- `Verification:`
- `Risks/Notes:`

## Safety
- Do not use destructive commands unless explicitly requested.
- Do not make broad assumptions about unrelated parts of the repo.
- If a requested change conflicts with existing work, stop and ask before proceeding.
