;; 10. **Test Description**: Utilize `nop` in conjunction with `call_indirect` to an imported function and validate the stack and control flow maintain correct execution across module boundaries.    - **Constraint**: Ensure `nop` does not interfere with `call_indirect` operation.    - **Relates to**: Confirms indirect call handling remains correct with cross-module `nop` presence.

(assert_invalid
  (module
    (import "math" "neg" (func $neg (param i32) (result i32)))
    (func $test (param i32) (result i32)
      (nop)
      (call_indirect (type $sig) (local.get 0) (i32.const 0))
    )
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
  )
  "type mismatch"
)