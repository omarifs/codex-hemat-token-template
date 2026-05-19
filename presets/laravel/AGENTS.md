# Laravel / PHP Agent Rules

## Goal
Optimize for fast, safe Laravel and PHP work with minimal context.

## Defaults
- Prefer controller, service, request, resource, migration, policy, and Blade-level changes.
- Keep changes small and localized.
- Avoid broad architecture changes unless explicitly requested.
- Prefer `php artisan` commands that match the task.
- Use `vendor/bin/pest` or `vendor/bin/phpunit` for targeted tests when available.

## Verification
- Run the smallest useful test command.
- Prefer a feature test or focused unit test over a full suite.
- If the change affects routing, auth, or validation, verify the related request path.

## Common Signals
- `composer.json` present: treat as PHP project.
- `artisan` present: use Laravel-specific commands.
- `tests/` present: prefer targeted test runs before broad validation.

