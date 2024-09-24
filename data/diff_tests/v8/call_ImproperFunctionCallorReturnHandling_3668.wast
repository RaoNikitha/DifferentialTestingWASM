;; 7. A function calling another function with multiple return values; verify correct return value pushing and stack alignment after the call.

(assert_invalid (module (func $func-returning-multiple (call 1 (i32.const 2) (i32.const 3))) (func (result i32 i32) (i32.const 10) (i32.const 20))) "type mismatch")