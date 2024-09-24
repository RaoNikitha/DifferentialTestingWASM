;; 8. **Non-Consistent Operand Stack Types**    - Configure operand stack types that diverge from what is expected by the branch targets, ensuring the `br_table` properly handles invalid transitions and unwinds the stack consistently.

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