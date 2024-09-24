;; 5. **Invalid Type Match across Import/Export Boundaries:**    - Execute `br_table` where targets include both local and imported/exported function labels, but with an operand type mismatch.    - **Constraint Checked:** Proper validation and type checking of operands against `br_table` targets across module boundaries.    - **Reasoning:** Ensures type consistency and control flow correctness even when dealing with type mismatches across imports and exports.

(assert_invalid
  (module 
    (import "env" "imported_func" (func $imported_func (result i32)))
    (func $local_func (result f32)
      (block (result i32)
        (br_table 0 1 (i32.const 0) (call $imported_func))
      )
    )
  )
  "type mismatch"
)