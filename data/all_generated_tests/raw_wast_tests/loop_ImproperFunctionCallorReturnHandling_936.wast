;; 7. **Test Description:**    Crafting a loop with an inlined immediate function call (inline type) where the function's return signature does not match the loop's expected type. This evaluates inline type checking within loops.

(assert_invalid
  (module
    (func $test
      (loop (result i32)
        (call $nonexistent_func)
      )
    )
  )
  "type mismatch"
)