;; 9. **Test for Deep Nested `br_table` with Intermediate `call_indirect` Invocations**:    - Construct deeply nested `br_table` instructions with interspersed `call_indirect` calls, verifying proper recursive behavior and value propagation.    - Constraint: Nested branching with intermediate indirect calls.    - Relation: Ensures nested and recursive operations correctly manage indirect calls.

(assert_invalid
  (module
    (type $nested-sig (func (param i32 i32) (result i32)))
    (table funcref (elem $nested-func))
    (func $nested-func (param i32 i32) (result i32)
      i32.const 0
    )
    (func $deep-nested
      (block 
        (block 
          (block
            (br_table 0 1 2
              (call_indirect (type $nested-sig) (i32.const 1) (i32.const 0) (i32.const 0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)