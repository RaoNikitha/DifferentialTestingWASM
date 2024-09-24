;; Use a forward branch in a `br_table` where mismatched operand stacks should cause the control to eventually hit an `unreachable` statement. This test assesses the consistency of operand and target matching in forward branches leading to the unreachable instruction.

(assert_invalid
  (module (func
    (block
      (block (result i64)
        (br_table 0 1 (i32.const 0) (unreachable))
      )
    )
  ))
  "type mismatch"
)