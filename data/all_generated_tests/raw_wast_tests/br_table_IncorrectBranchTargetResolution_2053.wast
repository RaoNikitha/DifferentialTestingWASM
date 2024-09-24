;; 3. **Test Description**: A `br_table` where the operand stack at the branch point does not match the expected stack configuration of the target block, testing if the label resolution causes a type mismatch error.

(assert_invalid
  (module
    (func (param i32 i32) (result i32)
      (block (result i32)
        (loop (result i32)
          (br_table 0 1 (i32.const 1) (local.get 0) (local.get 1))
        )
      )
    )
  )
  "type mismatch"
)