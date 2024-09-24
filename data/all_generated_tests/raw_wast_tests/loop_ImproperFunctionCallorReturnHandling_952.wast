;; 3. **Test Description**: Execute a loop where each iteration makes a `call` to a function that internally performs a `call_indirect` to another nested function. Ensure the values returned bubble correctly through nested calls.    **Constraint Checked**: Nested function and indirect calls return handling within loops.

(assert_invalid
  (module
    (type $t0 (func (param i32) (result i32)))
    (func $f1 (param i32) (result i32) (i32.const 42))
    (table funcref (elem $f1))
    (func (result i32)
      (loop (result i32)
        (call $f1 (i32.const 1))
        (call_indirect (type $t0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)