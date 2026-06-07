# Python Gemini Context

## Goal
Optimize Gemini for Python development with minimal token usage and high reliability.

## Stack-Aware Rules
- **Environment:** Use `venv` or `conda` if detected. Always check for `requirements.txt`.
- **Linter/Formatter:** Prefer `ruff` for speed or `flake8`/`black`.
- **Testing:** Use `pytest` or `unittest`.
- **Surgical Read:** Read only the function or class being modified.

## Verification
- Run `pytest path/to/test_file.py::test_name` for isolated checks.
- Verify using `python -c "import module; ..."` for simple logic.
