;; 3. **Test Description**: Design a scenario where a `br_if` targets the outermost block when the condition is always `true`. Ensure the condition evaluation leads to the branch consistently.

(assert_invalid
  (module (func $test
    (block $outermost
      (block
        (br_if 1 (i32.const 1))
      )
    )
    (i32.const 0)
  ))
  "type mismatch"
)