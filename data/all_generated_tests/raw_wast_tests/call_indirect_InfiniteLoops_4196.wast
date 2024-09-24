;; 5. **Test Description**: Test a `call_indirect` within a loop where the called function is intended to modify a global variable that is checked by the `br_if` to exit the loop. Ensure that any discrepancies in handling global variable scope and updates in function executions cause infinite loops or not.

(assert_invalid
  (module
    (type (func (param f64) (result i32)))
    (table 1 funcref)
    (global $g (mut i32) (i32.const 0))
    (elem (i32.const 0) funcref)
    (func $callee (param f64) (result i32)
      (global.set $g (i32.add (global.get $g) (i32.const 1)))
      (i32.const 1)
    )
    (func $test
      (block $exit
        (loop $loop
          (call_indirect (type 0) (i32.const 0) (f64.const 0.0))
          (br_if $exit (global.get $g))
          (br $loop)
        )
      )
    )
  )
  "type mismatch"
)