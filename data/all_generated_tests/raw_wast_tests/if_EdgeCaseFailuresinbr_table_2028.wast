;; 9. Use an `if` statement with a `then` block containing a `br_table` where the default branch target (fall-through) is outside the current `if` block's allowed branching scope, to test correct stack management and branching validation.

(assert_invalid
  (module (func $test-br_table-outside-if (result i32)
    (i32.const 0)
    (if (result i32)
      (then 
        (i32.const 0)
        (br_table 0 1)
      )
      (else
        (i32.const 1)
      )
    )
  ))
  "type mismatch"
)