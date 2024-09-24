;; 2. **Indirect Call in Loop with Type Mismatch**:    - Description: Define a `loop` with an expected result type of `i64`, and place a `call_indirect` inside the loop that returns an `i32`. The type mismatch between the loop's expected result and the actual function's result should lead to a runtime trap.

(assert_invalid
  (module
    (type $func_i32 (func (result i32)))
    (func $f (result i32) (i32.const 42))
    (table funcref (elem $f))
    (func (result i64)
      (loop
        (call_indirect (type $func_i32) (i32.const 0))
      )
    )
  )
  "type mismatch"
)