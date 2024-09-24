;; 9. **Test Description**: Initialize a loop with mixed valid and invalid block types in nested contexts, concluding with loop-ending `unreachable` instructions.    - **Constraint**: Ensures nested contexts validate each `blocktype` and execution path leading from one to another.    - **Unreachable Code Execution**: Invalid block types should trap execution early before reaching `unreachable`.

(assert_invalid
  (module
    (func $mixed-block-types (result i32)
      (i32.const 3)
      (loop (result i32)
        (i32.const 1)
        (loop (param i32)
          (i32.const 2)
          (br 1)
        )
        (i32.add)
        (loop (result i32 i32)
          (i32.const 0)
          (br 1)
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)