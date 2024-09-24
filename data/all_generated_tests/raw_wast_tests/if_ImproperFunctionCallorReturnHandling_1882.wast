;; - **Test 3**: Design an `if` block that conditionally returns from the middle of a called function based on an operand stack condition to test if context handling correctly unwinds nested calls.

(assert_invalid
  (module
    (func $nested_if_return
      (i32.const 1)
      (if (result i32)
        (then
          (i32.const 0)
          (if (then
            (return)
          ))
        )
        (else
          (i32.const 2)
        )
      )
      (drop)
    )
  )
  "type mismatch"
)