;; 2. **Test Description 2**:    - Create a WebAssembly module where `call_indirect` is used inside a loop that contains branches whose targets are outside the loop. Check for discrepancies where branching out of the loop might incorrectly resolve to either re-enter the loop or continue to an unintended block of code, allowing differential behavior in each implementation.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 2 funcref)
    (elem (i32.const 0) $f $g)
    (func $f (param i32) (call_indirect (type 0) (i32.const 1) (local.get 0)))
    (func $g (param i32) (loop (br_if 0 (i32.const 0)) (call_indirect (type 0) (i32.const 0) (local.get 0))))
    (func $test (param i32)
      (loop
        (call_indirect (type 0) (i32.const 0) (local.get 0))
        (br_if 1 (i32.eqz (local.get 0)))
        (call_indirect (type 0) (i32.const 1) (local.get 0))
      )
    )
  )
  "type mismatch"
)