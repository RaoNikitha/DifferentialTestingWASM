;; 1. **Test Description**: Call a function with a `br_if` instruction that incorrectly evaluates to always true. The function should jump to a specified point if a value on the stack is non-zero. This should result in different outputs if the condition is mis-evaluated.

(assert_invalid
  (module
    (func $jump-test
      (i32.const 1)
      (br_if 0 (call $always-br))
      (i32.const 42)
    )
    (func $always-br (result i32)
      (i32.const 1)
    )
  )
  "type mismatch"
)