;; 6. **Test Description:**    - A function includes a `call_indirect` immediately followed by `unreachable`. This test verifies the indirect call is bypassed due to the `unreachable`.    - **Constraint:** Verifies control flow is interrupted before an indirect call executes.    - **Improper Function Call or Return Handling:** Ensures the `call_indirect` mechanism does not proceed inadvertently.

(assert_invalid
  (module
    (type $t (func))
    (table 1 funcref)
    (elem (i32.const 0) $t)
    (func $test
      (call_indirect (type $t) (i32.const 0))
      (unreachable)
    )
  )
  "type mismatch"
)