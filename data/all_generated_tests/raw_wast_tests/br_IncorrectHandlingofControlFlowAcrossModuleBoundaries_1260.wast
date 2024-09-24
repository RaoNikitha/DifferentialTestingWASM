;; 1. **Import Function Call with Early Return:**    Create a test where the main module calls an imported function which itself calls another function in the same module but performs an early `br` before returning. This checks if the `br` instruction correctly handles the call stack and control flow context across module boundaries.

(assert_invalid
  (module
    (func $imported (import "env" "externalFunc") (param i32) (result i32))
    (func $internal (param i32) (result i32)
      (block (result i32) (br 0 (call $imported (local.get 0))))
      (i32.const 0)
    )
    (func (result i32)
      (call $internal (i32.const 10))
    )
  )
  "type mismatch"
)