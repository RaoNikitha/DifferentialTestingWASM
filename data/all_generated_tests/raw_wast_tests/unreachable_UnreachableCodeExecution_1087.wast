;; 8. **Test indirect function call leading to `unreachable`:**    - Create an indirect call table where a missing entry points to an `unreachable` and ensure proper traps on undefined function calls.    - **Constraint:** Ensures indirect call handling respects function table boundary conditions.    - **Related to**: Confirms if mismanaged function call indices lead to erroneously executed unreachables.

(assert_invalid
  (module
    (table 2 funcref)
    (elem (i32.const 0) $func1 $func2)
    (func $func1 (i32.const 0))
    (func $func2 (unreachable))
    (func $test (call_indirect (type (func)) (i32.const 2)))
  )
  "type mismatch"
)