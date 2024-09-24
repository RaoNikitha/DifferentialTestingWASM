;; Test a forward branch where the `br` instruction targets an `if` block, thus exiting the `if` and resuming after its `end` instruction. Ensure the operand stack is preserved correctly. Testing for: Correctly handling forward branches to `if` blocks without disrupting the intended CFG.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 1)
      (if (result i32)
        (then (br 0) (i32.const 2))
        (else (i32.const 3))
      )
    )
  )
  "type mismatch"
)