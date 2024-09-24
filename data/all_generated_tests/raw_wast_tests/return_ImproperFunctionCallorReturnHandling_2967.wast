;; 6. Test a scenario where a function calls another function and returns immediately (tail call). Ensure that both engines correctly handle the return without extra operands remaining on the stack, exposing potential flaws in Wizard Engine's stack-polymorphic handling.

(assert_invalid
  (module
    (func $callee (result i32) (i32.const 42))
    (func $caller (result i32) (call $callee) (return (call $callee)))
  )
  "type mismatch"
)