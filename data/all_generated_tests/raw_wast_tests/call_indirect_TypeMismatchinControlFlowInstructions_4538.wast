;; 7. **Indirect Call within a Block Expecting Multiple Result Types**:    - Description: Use a `block` that specifies multiple result types `[i32, f64]` but the indirect call inside the block returns only `[i32]`. This type inconsistency should lead to a type error upon block exit.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $func))
    (func $func (param i32) (result i32)
      (i32.const 0)
    )
    (func
      (block (result i32 f64)
        (call_indirect (type $sig) (i32.const 0))
      )
    )
  )
  "type mismatch"
)