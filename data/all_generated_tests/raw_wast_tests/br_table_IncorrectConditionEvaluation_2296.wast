;; Test 6: Use multiple `br_table` instructions within a single function, each with different label vectors and default labels. Ensure that the state management and operand consumption are consistent across multiple branching scenarios. The test validates the procedural handling of subsequent branching instructions.

(assert_invalid
  (module
    (func $multiple-br_table
      (block (result i32)
        (block (result i32) 
          (block
            (br_table 2 1 0 (i32.const 0))
            (i32.const 0)
          )
          (i32.const 1)
        )
        (block
          (loop
            (br_table 1 0 (i32.const 1))
            (i32.const 2)
          )
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)