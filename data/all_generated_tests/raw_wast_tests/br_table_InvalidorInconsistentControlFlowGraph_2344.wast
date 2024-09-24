;; Test 4: Design a forward branch scenario where `br_table` is at the end of a block with mismatched operand stack configurations, checking if forward branches respect the type requirements of the targeted block. - **Constraint Tested**: Operand stack consistency and matching for forward branches.

(assert_invalid
  (module
    (func $mismatched-stack-forward
      (block (result i32)
        (block
          (i32.const 42)
          (br_table 0 0 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)