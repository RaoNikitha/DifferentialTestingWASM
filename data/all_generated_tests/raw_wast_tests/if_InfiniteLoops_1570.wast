;; 1. **Test 1**: Create an `if` instruction with a nested `loop` where the `resetInit` mechanism checks if the loop is correctly re-initialized after exiting the `else` block. Ensure that the control flow can properly break out of the loop using a `br_if` instruction.

(assert_invalid
  (module (func (if (result i32) (i32.const 1)
    (then 
      (loop (if (i32.const 0) (then (br_if 0 (i32.const 1))) (else (br_if 0 (i32.const 1)))))
    )
    (else (i32.const 1))
  )))
  "type mismatch"
)