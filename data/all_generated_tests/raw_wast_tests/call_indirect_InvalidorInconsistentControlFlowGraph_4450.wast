;; 9. **Test Description**:    - Design a scenario where a `call_indirect` instruction is used within a conditional branch with a dependent albeit incorrect type signature based on a predicate value.    - **Constraint**: Checking for both conditional expression evaluation and type signature matching.    - **CFG Relation**: CFG should correctly differentiate between valid and invalid conditional branches, leading to appropriate traps based on the type signature mismatches.

(assert_invalid
  (module
    (type $correct (func (param i32)))
    (type $incorrect (func (param i32 f64)))
    (table 1 funcref)
    (func $conditional_call (param $pred i32)
      (if (i32.eqz (local.get $pred))
        (call_indirect (type $correct) (i32.const 0))
        (call_indirect (type $incorrect) (i32.const 0))
      )
    )
  )
  "type mismatch"
)