;; 4. **Test Description**: Design a block with multiple `br_table` targets, some expecting `i32` and others `f64`, causing a type mismatch depending on the operand used for branching.

(assert_invalid
  (module
    (func (param i32) (result f64)
      (block (result f64)
        (br_table 0 1 (local.get 0) (f64.const 1.0))
      )
    )
  )
  "type mismatch"
)