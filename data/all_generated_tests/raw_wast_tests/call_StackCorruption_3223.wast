;; 2. Test calling a function that requires multiple arguments but returns a single value. Ensure that popping multiple arguments from the stack happens correctly without causing underflow or incorrectly ordering the arguments.

(assert_invalid
  (module
    (type (func (param i32 i32 i32) (result i32)))
    (func $example (param i32 i32 i32) (result i32)
      (i32.add (get_local 0) (get_local 1))
    )
    (func $test (result i32)
      (call 0 (i32.const 1) (i32.const 2))
    )
  )
  "type mismatch"
)