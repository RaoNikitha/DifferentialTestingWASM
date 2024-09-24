;; 1. **Nested Block with Indirect Function Call:**    - **Test Description:** Create a nested block structure where an indirect function call is made using `call_indirect`. The block should have addressing to labels at various depths.    - **Constraint Checked:** Validity of label indexing and type adherence in `call_indirect` within nested contexts.    - **Relation to Improper Function Handling:** Ensure `call_indirect` resolves correctly within nested blocks and respects type constraints.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 2 funcref)
    (elem (i32.const 0) $callee)
    (func $callee (param i32) (result i32)
      local.get 0
    )
    (func (block (result i32)
      (block (result i32)
        (i32.const 1)
        (block (result i32)
          (call_indirect (type $sig) (i32.const 0) (br 1 (i32.const 42)))
        )
      )
    ))
  )
  "type mismatch"
)