;; Design a `br_table` test with operand stack manipulation before and after the branch. Induce a mismatch in operand types or counts to see if any branching issues are due to stack state mismanagement, affecting branch target resolution.

(assert_invalid
  (module (func $operand-stack-mismatch
    (block (result i32)
      (i32.const 1)
      (block (result i32)
        (i32.const 2) (i32.const 3)
        (br_table 0 1)
        (i32.add)
      )
      (i32.add)
    )
  ))
  "type mismatch"
)