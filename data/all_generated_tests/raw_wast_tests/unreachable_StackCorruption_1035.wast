;; 6. Test Description: Include a `call` to another function that contains `unreachable` and verify if returning from the function correctly handles the stack without any corruptions.

(assert_invalid
  (module
    (func $callee
      (unreachable)
    )
    (func $caller (result i32)
      (call $callee)
      (i32.const 1)
    )
  )
  "type mismatch"
)