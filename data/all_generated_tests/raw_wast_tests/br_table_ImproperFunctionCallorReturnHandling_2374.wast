;; 4. **Test Description: Mismatch in `call_indirect` Types:**    - Use a `br_table` to lead into a `call_indirect` where parameters or return values do not match expected function signature.    - **Constraint Checked:** Validates strict checking of types in indirect calls resulting from `br_table`.    - **Relation to Incorrect Function Call:** Highlights how mismatches in types affect calls and if they fall back to default correctly.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $fn)
    (func $fn (result i32) (i32.const 42))
    (func
      (block $block1 (result i32)
        (block $block2 (result i32)
          (br_table $block2 $block1 (i32.const 0))
          (call_indirect (type $sig) (i32.const 0) (i64.const 1))
        )
      )
    )
  )
  "type mismatch"
)