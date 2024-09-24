;; 10. Build a WebAssembly function `f7` returning `i32` and place it in the table, but call it with a `funcref` expecting it to return `f64`. The incorrect result type should cause differential behavior with correct and incorrect type enforcement resulting in a trap.  Each test is designed to trigger traps by mismatches in typing expected versus what is provided dynamically, focusing specifically on type mismatches in the control flow invoking `call_indirect` instructions across different WebAssembly implementations.

(assert_invalid
  (module
    (type $sig1 (func (result i32)))
    (type $sig2 (func (result f64)))
    (func $f (type $sig1) (i32.const 42))
    (table 1 funcref (elem $f))
    (func $type-mismatch-call
      (call_indirect (type $sig2) (i32.const 0))
    )
  )
  "type mismatch"
)