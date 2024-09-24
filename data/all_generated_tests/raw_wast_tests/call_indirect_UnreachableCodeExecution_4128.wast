;; 7. **Recursive Call_Indirect Ending in Unreachable**:    - Implement a recursive call using `call_indirect` and place an `unreachable` instruction in the base case when incorrect parameters are supplied.    - Checks behavior during dynamic type resolution in recursive contexts ensuring traps before hitting unreachable paths.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table $tab 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32) (result i32)
      (local.get 0)
      (i32.const 0)
      (call_indirect (type $sig) (local.get 0))
      (unreachable)
    )
    (func (export "start") (param i32) (result i32)
      (call_indirect (type $sig) (local.get 0))
    )
  )
  "type mismatch"
)