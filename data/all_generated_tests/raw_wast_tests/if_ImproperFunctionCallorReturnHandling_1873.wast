;; 4. Create an `if` block where an invalid indirect function call (incorrect type or missing from the table) is present in the `else` branch, such that the execution traps correctly.

(assert_invalid
  (module
    (table funcref (elem))
    (func $invalid-call (if (i32.const 0)
      (then (nop))
      (else (call_indirect (type $nonexistent-function-type) (i32.const 0)))
      ))
    )
  "type mismatch"
)