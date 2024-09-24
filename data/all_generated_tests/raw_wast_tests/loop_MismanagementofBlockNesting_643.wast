;; 4. **Test: Loop with Mixed Block Types**    - **Description**: Test a loop containing both `block` and a nested loop. Include branches that cross both.    - **Constraint Being Checked**: Correct tracking of mixed block types and their labels.    - **Mismanagement**: Misinterpretation of block nesting causing wrong branch targets.

(assert_invalid
  (module
    (func $loop-mixed-block-types
      (block (result i32)
        (loop (result i32)
          (i32.const 1)
          (br 1)
          (i32.const 2)
        )
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)