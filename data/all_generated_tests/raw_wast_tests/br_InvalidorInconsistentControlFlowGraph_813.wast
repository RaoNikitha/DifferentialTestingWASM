;; 4. **Test Description**: Construct a sequence where an outer `block` is nested with multiple inner blocks, and `br 2` within an innermost block targets the outermost block.    - **Constraint**: Tests the handling of forward branches and verifies that the branch correctly resumes after the `end` of the targeted block.

(assert_invalid
  (module
    (func $test-br-2
      (block
        (block
          (block
            (br 2)
          )
        )
      )
    )
  )
  "type mismatch"
)