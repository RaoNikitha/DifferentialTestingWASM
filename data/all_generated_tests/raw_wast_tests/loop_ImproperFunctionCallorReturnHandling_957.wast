;; 8. **Test Description**: Implement a complex loop structure making both `call` and `call_indirect` calls to a series of functions that modify stack and return values. Ensure stack unwinding, and values are maintained across back-to-back calls.    **Constraint Checked**: Stack management and consistency in nested function calls within loops.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $f1 $f2))
    (func $f1 (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (func $f2 (param i32) (result i32)
      (i32.sub (local.get 0) (i32.const 1))
    )
    (func $test
      (i32.const 5)
      (loop (result i32)
        (call $f1)
        (call_indirect (type $sig) (i32.const 1))
        (br_if 0 (i32.eqz (local.tee 0)))
      )
    )
  )
  "type mismatch"
)