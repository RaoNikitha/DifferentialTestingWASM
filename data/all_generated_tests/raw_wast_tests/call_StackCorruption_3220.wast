;; 9. Construct a scenario with a chain of `call` instructions where an intermediate function has fewer arguments than specified, checking that this does not corrupt the stack for subsequent calls.

(assert_invalid
  (module
    (func $intermediate (param i32) (result i32)
      (i32.const 0))
    (func $first (param i32 i32) (result i32)
      (call $intermediate (i32.const 1)))
    (func $main (param i32) (result i32)
      (call $first (i32.const 1) (i32.const 2)))
  )
  "type mismatch"
)