# AI Operation Guide

## Goal
Keep Codex and Gemini fast, low-cost, and useful across many project types.

## Default Strategy
- Use short, scoped prompts.
- Keep the active context small.
- Prefer direct fixes over exploratory work.
- Verify only what is needed for the change.

## Codex
- Use `AGENTS.md` as the repo instruction source.
- Default to the smallest reasonable task scope.
- For straightforward app work, keep the session focused and avoid broad repo scans.
- For complex or multi-file changes, break the work into small milestones and verify each one.
- Recommended model usage:
  - Small edits, fixes, and routine implementation: `gpt-5.1-codex`
  - Hard refactors, architecture work, or long-horizon tasks: `gpt-5.3-codex`
  - Only move to larger general models when the task clearly needs broader reasoning.

## Gemini
- Use `GEMINI.md` as the project context file.
- The active repo setting is `.gemini/settings.json`.
- Recommended default model: `gemini-2.5-flash`
- Use `gemini-2.5-flash-lite` for very small, cheap, high-volume tasks.
- Use `gemini-2.5-pro` only when the task is genuinely complex or the cheap model stalls.
- Keep `maxSessionTurns` low enough to avoid context bloat, but high enough to complete the task cleanly.

## Project-Type Routing
- Laravel / PHP:
  - Prefer `php artisan`, `vendor/bin/pest`, or `vendor/bin/phpunit`.
  - Keep changes in controllers, services, requests, resources, migrations, and Blade files as needed.
- Node / TypeScript / Frontend:
  - Prefer package scripts, targeted lint, unit tests, and build checks.
  - Avoid large UI refactors unless the user asked for them.
- Documentation or prompt repos:
  - Keep the output concise and improve clarity, reuse, and example quality.
- Mixed stacks:
  - Verify only the stack touched by the change.

## Cost Control Rules
- Read only relevant files.
- Avoid repeated full-tree scans.
- Prefer one focused verification command over many broad ones.
- Summarize output instead of pasting large logs.
- Reuse existing templates and instructions whenever possible.

## Practical Workflow
- Step 1: identify the exact file set.
- Step 2: implement the smallest safe change.
- Step 3: run the lightest useful verification.
- Step 4: report changed files, what changed, verification, and risks.

