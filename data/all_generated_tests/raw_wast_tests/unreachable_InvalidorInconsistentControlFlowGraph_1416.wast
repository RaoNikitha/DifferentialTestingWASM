;; 7. **Test Description:** Place `unreachable` amid a function using `call` and `call_indirect` to other functions that might return or modify stack state. This tests whether the CFG correctly handles traps within function calls and indirect calls.    - **Constraint:** Trap should halt execution before completing function calls.    - **Relation to CFG:** Validates CFG's call and indirect call consistency with trapping.

(assert_invalid
  (module
    (type $t0 (func (result i32)))
    (import "env" "externalFunc" (func $externalFunc (result i32)))
    (func $callee (result i32)
      unreachable
      (i32.const 42)
    )
    (func (result i32)
      call $externalFunc
      call_indirect (type $t0) (i32.const 0)
    )
  )
  "type mismatch"
)