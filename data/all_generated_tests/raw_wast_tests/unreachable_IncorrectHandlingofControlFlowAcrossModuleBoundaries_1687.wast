;; 8. Implement a test where an `unreachable` instruction is inside a nested block structure, with the block located inside an imported function. Ensure the importing module correctly processes the trap across these nested and modular boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func (block (result i32) (unreachable) (call $external_func) (i32.const 1)))
  )
  "type mismatch"
)