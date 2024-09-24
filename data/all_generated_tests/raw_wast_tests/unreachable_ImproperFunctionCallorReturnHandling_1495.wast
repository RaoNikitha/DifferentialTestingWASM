;; 6. **Call Indirect Handling with Unreachable:**    - **Test Description:** Implement a function that uses `call_indirect` to dynamically invoke another function which eventually hits an `unreachable` instruction.    - **Constraint Checked:** Verifies type checking and the correct trapping behavior when `call_indirect` targets a function that leads directly to `unreachable`.    - **Improper Handling Aspect:** Ensures that `call_indirect` does not bypass traps and correctly identifies the indirect call leading to `unreachable`.

(assert_invalid
  (module
    (type $indirect_func_type (func (result i32)))
    (table 1 1 funcref)
    (elem (i32.const 0) $unreachable_func)
    (func $unreachable_func (result i32)
      (unreachable)
    )
    (func (result i32)
      (call_indirect (type $indirect_func_type) (i32.const 0))
    )
  )
  "call_indirect leading to unreachable"
)