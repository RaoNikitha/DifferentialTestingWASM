;; 9. **Test Description 9**:    - **Scenario**: Add a `nop` right before a `call_indirect` in a function that also updates global state.    - **Constraint Check**: Verify that the `nop` does not affect the global state update or the indirect call.    - **Relation to Improper Handling**: Ensures precise execution of side-effect-laden indirect calls even with `nop`.

(assert_malformed
  (module
    (func $test (param i32) (result i32)
      (global.get 0)
      (nop)
      (call_indirect (type $functype) (local.get 0))
    )
    (type $functype (func (param i32) (result i32)))
    (table 1 funcref)
    (global (mut i32) (i32.const 10))
  )
  "unknown operator"
)