;; 5. Construct a function that performs a `return` from within a loop containing a `call` to another function. This verifies how the loop unwinding and return sequence are managed when intermediate function calls exist.

(assert_invalid
  (module
    (func $callee (result i32) (i32.const 42))
    (func $caller (result i32)
      (loop $loop
        (call $callee)
        (return)
      )
    )
  )
  "type mismatch"
)