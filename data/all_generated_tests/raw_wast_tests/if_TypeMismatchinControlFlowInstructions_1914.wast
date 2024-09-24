;; Test an `if` instruction where the `then` section calls a function returning `i32`, but the `else` section triggers an `unreachable` instruction. This ensures that type-matching and error-handling mechanisms are appropriately checked and implemented in both environments.

(assert_invalid
  (module (func $if_then_func_else_unreachable (result i32)
    (if (result i32) (i32.const 1) (then (call $dummy_func)) (else (unreachable)))
  ))
  "type mismatch"
)