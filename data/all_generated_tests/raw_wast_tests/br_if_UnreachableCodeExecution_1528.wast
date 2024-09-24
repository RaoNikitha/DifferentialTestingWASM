;; 9. **Test Stack Depth during Branch**: A deeply nested `loop` containing a `br_if` targeting an unreachable block, testing if stack resizing and unwinding handle each control transfer correctly.

(assert_invalid
  (module
    (func $test-deep-loop-branch
      (block
        (loop (block (loop (block
          ;; Unreachable block due to br_if
          (i32.const 0)
          (br_if 2 (i32.const 1))
          (unreachable)
        ))))))
    )
  )
  "type mismatch"
)