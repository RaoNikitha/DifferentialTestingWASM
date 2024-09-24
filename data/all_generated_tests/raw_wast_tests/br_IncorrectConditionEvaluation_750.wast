;; Test 1: Construct a WebAssembly module with an `if` block containing a `br_if` instruction that should only branch if the top of the stack is zero. Verify the behavior by using non-zero values, which should not trigger the branch. This checks if the condition is correctly evaluated as false.

(assert_invalid
  (module
    (func (result i32)
      (local i32)
      (if (result i32)
        (i32.const 1)
        (then (i32.const 2) (br_if 0 (i32.const 3)))
        (else (i32.const 4))
      )
    )
  )
  "type mismatch"
)