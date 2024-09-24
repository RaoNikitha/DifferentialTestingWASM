;; 10. **Test Case: Nested Block with Mixed Control Flow**    - **Test Description**: Create nested blocks incorporating loops, `if-else`, and `br_table` to test control flow within deeply nested structures. Verify that exit points, branch targets, and operand stacks maintain integrity across these mixed control flow instructions.    - **Constraint**: Validates complete control flow correctness, including loop and condition handling within nested contexts.    - **Relation to Mismanagement**: Complex control structures will reveal mismanagement quickly due to the flow confusion potentially arising out of incorrect nesting/label indexing.

(assert_invalid
  (module 
    (func $nested-blocks-mixed-control-flow (result i32)
      (block (result i32) 
        (loop (result i32)
          (if (i32.eqz (i32.const 0))
            (then (br_table 0 1 (i32.const 1)))
            (else (br 1 (i32.const 0)))
          )
        )
      )
    )
  )
  "type mismatch"
)