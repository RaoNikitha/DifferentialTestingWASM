;; 2. **Test 2 - Operand Type Length Mismatch**:    Construct a `br_table` where the operand type sequences for target labels differ in length from the default label type sequence. This ensures the implementation checks consistency in operand stack management adhering to CFG constraints.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (loop (result f32 i32)
          (br_table 0 1 (i32.const 1) (local.get 0))
        )
      )
    )
  )
  "type mismatch"
)