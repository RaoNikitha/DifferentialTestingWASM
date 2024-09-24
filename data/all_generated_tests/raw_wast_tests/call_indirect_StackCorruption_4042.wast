;; 1. **Test 1: Function Type Mismatch Stack Push**:    Create a function signature with a mismatch between the expected and provided function types. Push multiple mismatched types on the stack and attempt a `call_indirect` operation. Validate that the stack corruption fails gracefully by catching traps due to the functional mismatch.

(assert_invalid
  (module
    (func $f (param i32 f32))
    (type $sig (func (param i32)))
    (table funcref (elem $f))
    (func $test
      (i32.const 0)  ;; Pushing i32 expected index
      (i32.const 42) ;; Extra i32 argument
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)