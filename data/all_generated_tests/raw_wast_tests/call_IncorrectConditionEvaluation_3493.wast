;; Test 2: Define a function that takes multiple arguments and calls another function. Pass fewer arguments to it and ensure the error handling correctly catches this mismatch. Check if both implementations handle the error consistently.

(assert_invalid
  (module
    (func $multiple-args-fewer-passed
      (call 1 (i32.const 42))
    )
    (func (param i32 i32))
  )
  "type mismatch"
)