;; Write a test where a `call` inside the loop reaches maximum call stack depth, and check if the implementation properly returns to the loop body or improperly exits causing inconsistent behavior.

(assert_invalid
  (module
    (func $recursive (result i32)
      (i32.const 0)
      (call $recursive)
      (i32.const 1)
    )
    (func
      (loop (block $loop
        (call $recursive)
        (br $loop)
      ))
    )
  )
  "unreachable"
)