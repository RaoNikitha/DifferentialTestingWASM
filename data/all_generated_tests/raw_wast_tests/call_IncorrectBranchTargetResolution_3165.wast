;; 4. **Test Description**: Use a function that indirectly calls another function through a table, with the target function containing a `br_table` instruction. Check correctness of multiple branch targets.    - **Constraint**: Ensures proper resolution of indirect branch targets using `br_table`.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func_a)
    (func $func_a (param i32) (result i32)
      (local.get 0)
      (br_table 0 1 (local.get 0))
    )
    (func (call_indirect (type $sig) (i32.const 0) (i32.const 5)))
  )
  "invalid br_table index"
)