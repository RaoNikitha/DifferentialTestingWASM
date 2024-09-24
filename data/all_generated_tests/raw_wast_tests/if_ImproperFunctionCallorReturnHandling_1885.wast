;; - **Test 6**: Perform a test where an `if` block calls an exported function conditionally, which itself contains an `if` block that calls another function, creating a multi-level call hierarchy to test proper label handling.

(assert_invalid
  (module
    (func $foo (result i32) (i32.const 1) (if (result i32) (i32.const 0)
      (then (call $bar) (i32.const 1))
      (else (call $baz) (i32.const 1))
    ))
    (func $bar (result i32) (i32.const 2) (if (result i32) (i32.const 0)
      (then (i32.const 2))
      (else (i32.const 3))
    ))
    (func $baz (result i32) (unreachable))
    (export "test" (func $foo))
  )
  "type mismatch"
)