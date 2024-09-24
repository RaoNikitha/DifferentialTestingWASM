;; 8. Generate an indirect call to a function that returns multiple values across module boundaries, confirming that the implementation handles correct result value placement on the operand stack per the expected return type.

(assert_invalid
  (module
    (type $sig (func (result i32 i32)))
    (func $f (result i32 i32) (i32.const 1) (i32.const 2))
    (table funcref (elem $f))
    (import "env" "importedFunc" (func $imported (type $sig)))
    (func $indirect-call
      (result i32 i32)
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)