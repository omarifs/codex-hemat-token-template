# Node / TypeScript Agent Rules

## Goal
Optimize for fast, safe Node and TypeScript work with minimal context.

## Defaults
- Prefer scoped changes in source, components, hooks, services, and config files.
- Keep UI and logic changes small unless the user asks for a larger refactor.
- Use the project package manager and existing scripts.
- Avoid adding dependencies unless they are clearly needed.

## Verification
- Use the lightest meaningful command: targeted test, lint, typecheck, or build.
- Prefer the project’s own script names over generic commands when available.
- If a change touches UI behavior, verify the affected page or component path.

## Common Signals
- `package.json` present: treat as Node project.
- Lockfile present: follow the lockfile’s package manager.
- `tsconfig.json` present: check types when changes touch logic or API contracts.

