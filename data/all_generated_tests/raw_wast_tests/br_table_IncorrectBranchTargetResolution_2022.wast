;; Design a test with a `br_table` instruction containing a mix of forward and backward branches. Verify that the branch resolves to the correct target by checking values on the operand stack, ensuring that forward branches exit the correct blocks and backward branches correctly loop.

(assert_invalid
  (module (func
    (block
      (loop
        (br_table 1 0 (i32.const 1))
      )
      (br_table 0 (i32.const 0))
    )
  ))
  "type mismatch"
)