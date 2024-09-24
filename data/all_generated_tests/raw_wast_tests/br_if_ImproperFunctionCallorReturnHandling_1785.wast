;; 6. **Test 6: Mismatched Operand Types Post Return**: Use a `br_if` right after a function return where the operand stack's state does not match expected types for continuation, ensuring both implementations validate stack types properly. `wizard_engine`'s strict checks against `WASM` behavior differences are key here.

(assert_invalid
  (module (func $mismatched-operands (result i32)
    (return (i32.const 42))
    (br_if 0 (i32.const 1))
  ))
  "type mismatch"
)