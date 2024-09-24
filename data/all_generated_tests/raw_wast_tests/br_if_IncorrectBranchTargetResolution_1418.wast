;; 9. **Test Description**: Create a test with a nested `loop` inside a `block` where a `br_if` in the loop should target the block (label 1). Verify if the branch mistakenly stays within the loop or targets an unrelated block or loop.

(assert_invalid
  (module
    (func $nested-loop-in-block
      (block
        (loop
          (br_if 1 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)