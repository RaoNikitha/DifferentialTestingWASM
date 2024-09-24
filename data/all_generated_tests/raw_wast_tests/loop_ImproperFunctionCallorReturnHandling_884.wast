;; Create a loop with multiple nested calls that each return values, followed by a branch to the start of the loop testing if stack unwinding and operands management, including the return values, are consistent across implementations.

(assert_invalid
  (module
    (func $test-loop
      (i32.const 0)
      (loop (result i32)
        (block (block (call $someFunc) (br 1)) (i32.const 1))
        (br 0)
      )
      (i32.add)
    )
    (func $someFunc (result i32)
      (i32.const 42)
    )
  )
  "type mismatch"
)