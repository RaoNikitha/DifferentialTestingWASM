;; 5. **Complex control flow with br_table to imports**:    - Develop a block that uses `br_table` to branch to various calls to imported functions based on an operand stack value.    - Verify that control flow transitions seamlessly and the operand stack remains consistent across module boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32)))
    (func (param i32) (result i32)
      (block (result i32)
        (get_local 0)
        (br_table 0 0 $external_func)
      )
    )
  )
  "type mismatch"
)