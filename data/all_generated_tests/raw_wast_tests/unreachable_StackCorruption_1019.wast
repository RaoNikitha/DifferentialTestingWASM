;; 10. **Test: Unreachable in Nested Function Calls**    - Generate nested function calls with inner functions having unreachable and then validate the parent function.    - **Stack Corruption Check:** Ensures nested calls maintain correct stack boundaries isolating stack frames efficiently post-unreachable.

(assert_invalid
  (module
    (func $nested_unreachable
      (call $inner)
      (i32.const 1)
    )
    (func $inner
      (block (unreachable))
      (i32.const 0)
    )
  )
  "type mismatch"
)