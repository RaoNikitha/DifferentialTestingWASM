;; 6. Define a module with a function that calls another function, which in turn modifies the stack height improperly before returning. Check for stack overflow or underflow errors being consistently handled.

(assert_invalid
  (module
    (func $caller (call $callee))
    (func $callee
      (local i32)
      (local.set 0 (i32.const 0))
      (drop)
      (drop)
    )
  )
  "stack underflow"
)