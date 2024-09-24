;; 9. Construct a test with a nested function call structure using `call_indirect`, where an inner function contains a branchy instruction erroneously targeting an external function's label. This test determines the implementations' ability to trap such resolution errors in nested contexts.

(assert_invalid
  (module
    (func $external (result i32) (i32.const 42))
    (func $inner (type 0)
      (call_indirect (type 0) (i32.const 0))
      (br 0))
    (type (;0;) (func (result i32)))
    (table funcref (elem $external $inner))
    (func $test (type 0)
      (call_indirect (type 0) (i32.const 1))
    )
  )
  "type mismatch"
)