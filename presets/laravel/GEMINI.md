# Laravel / PHP Gemini Context

## Goal
Optimize Gemini for Laravel and PHP work with minimal context and practical verification.

## Defaults
- Keep the scope narrow.
- Prefer `php artisan` and targeted test commands.
- Avoid reading unrelated files.
- Prefer the smallest safe fix.

## Verification
- Use `vendor/bin/pest` or `vendor/bin/phpunit` when applicable.
- Verify route, validation, controller, service, and view behavior only for the affected flow.

