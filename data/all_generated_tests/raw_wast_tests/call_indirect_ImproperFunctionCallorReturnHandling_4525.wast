;; 4. **Valid Function Type Check**: Create a test where the `call_indirect` instruction calls a valid function but with a different parameter type. Ensure the implementation checks and traps on parameter type mismatch.

(assert_invalid
  (module
    (type $sig (func (param i64)))
    (table 1 funcref)
    (func $test
      (call_indirect (type $sig) (i32.const 0) (i32.const 42))
    )
  )
  "type mismatch"
)