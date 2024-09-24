;; 2. **Test Description**:    An `if` instruction with an operand stack height mismatch: `then` block adds an integer, `else` block removes an integer. The test checks if the end stack height conforms to blocktype constraints.

(assert_invalid
  (module
    (func $stack-height-mismatch
      (result i32)
      (if (result i32)
        (then (i32.const 1) (i32.add))
        (else (i32.const 2) (i32.const 3) (i32.sub))
      )
    )
  )
  "type mismatch"
)