;; 3. **Test Description**:    - Design a scenario where `br_if` decides if `call_indirect` should be executed with an index matching the expected function type or an invalid type. Observe if `call_indirect` traps differently based on how `br_if` evaluates the condition.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i64)))
    (table funcref (elem 0 1))
    (func (param i32) 
      (br_if 0 (i32.eqz (local.get 0)) 
        (call_indirect (type 1) (i32.const 1))
      )
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)