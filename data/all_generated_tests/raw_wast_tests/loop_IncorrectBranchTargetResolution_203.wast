;; 4. **Re-entering Loop After Unconditional Branch**    - Test a single loop containing an unconditional `br` instruction that branches back to the loop itself. This checks the operand stack is reset correctly and re-entry is handled properly.

(assert_invalid
  (module
    (func $reenter-loop-after-unconditional-branch
      (i32.const 0)
      (loop 
        (br 0)
      )
    )
  )
  "type mismatch"
)