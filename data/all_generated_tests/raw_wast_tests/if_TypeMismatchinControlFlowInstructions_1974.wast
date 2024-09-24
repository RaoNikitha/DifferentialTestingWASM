;; Test 5: Define an `if` instruction with a block type of `[] -> []`, but within the `then` block, add a branch that incorrectly expects an `i32` type on the operand stack.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 0)
      (if (result i32) 
        (then (br 0) (i32.const 1)) 
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)