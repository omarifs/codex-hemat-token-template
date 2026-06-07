# Golang Gemini Context

## Goal
Optimize Gemini for Go development with type safety and idiomatic patterns.

## Stack-Aware Rules
- **Tooling:** Use `go mod tidy`, `go fmt`, and `go build`.
- **Pattern:** Follow "Effective Go" principles (idiomatic error handling, composition).
- **Concurrency:** Be cautious with goroutines; ensure proper synchronization (mutex/channels).
- **Surgical Read:** Focus on specific `.go` files; avoid broad scans of the `vendor` folder.

## Verification
- Run `go test -v ./path/to/pkg -run TestName`.
- Ensure `go build` passes before claiming success.
