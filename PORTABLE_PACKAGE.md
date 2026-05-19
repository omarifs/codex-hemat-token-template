# Portable Package

## Minimal files to copy into a target repo
- `AGENTS.md`
- `GEMINI.md`
- `.gemini/settings.json`
- `AI_OPERATION_GUIDE.md`
- `ai.cmd`
- `ai.ps1`
- `install-ai.cmd`
- `install-ai.ps1`
- `install-alias.cmd`
- `install-alias.ps1`
- `RUN_ME_FIRST.md`

## Optional files
- `presets/laravel/AGENTS.md`
- `presets/laravel/GEMINI.md`
- `presets/node/AGENTS.md`
- `presets/node/GEMINI.md`
- `presets/docs/AGENTS.md`
- `presets/docs/GEMINI.md`

## Recommended workflow
1. Keep this template repo as the source of truth.
2. Run `install-alias.cmd` once.
3. Use `ai` for daily setup in any repo.
4. Use `ai-setup -Profile <name>` when you want a specific preset.

