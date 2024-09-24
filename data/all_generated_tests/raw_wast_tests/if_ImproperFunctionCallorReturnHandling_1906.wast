;; 7. **Indirect Call with Incorrect Table Index in `if` Block**:    - Use an out-of-bound table index for `call_indirect`.    - Ensure this leads to a proper trap or unmanaged continuation in different implementations.

(assert_invalid
  (module
    (table 1 funcref)
    (elem (i32.const 0) $func1)
    (func $func1 (result i32) (i32.const 1))
    (func $test
      (if (result i32)
        (i32.const 0)
        (then (call_indirect (type $sig) (i32.const 1))) ;; invalid index
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)