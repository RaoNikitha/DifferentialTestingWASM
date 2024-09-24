;; **Test 5**: Evaluate a conditional branch instruction (e.g., `br_if`) combined with the `call` instruction. Check if the condition evaluation deals correctly with unexpected or incorrect types before invoking the function.

(assert_invalid
  (module
    (func $cond-branch-call
      i32.const 1
      br_if 0 (call 1 (i32.const 42))
    )
    (func (param i32) (result i32))
  )
  "type mismatch"
)