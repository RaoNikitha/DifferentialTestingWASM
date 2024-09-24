;; 9. **Test Description**: Define a test with blocks containing variable-length `br_table` instructions that branch into different block depths. Check whether the stack state is accurately managed and consistent across different jump targets.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (i32.const 0)
          (br_table 0 1)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)