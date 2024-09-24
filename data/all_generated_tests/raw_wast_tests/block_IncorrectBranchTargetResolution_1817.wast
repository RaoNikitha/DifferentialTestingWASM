;; 8. **Test Description**: Develop a block with multiple branch instructions at different depths, culminating in a `br` to the outermost block. Insert stack-related operations before each branch to identify inconsistencies in stack unwinding and correct branch target resolution.

(assert_invalid
  (module
    (func $test-block-branch-multiple-depths 
      (block (result i32)
        (block
          (br 1)
          (i32.const 1)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)