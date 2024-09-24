;; 3. Design a scenario with multiple `if` constructs nested within `block` structures. Use `br` to break from an inner if to the outermost block. Verify that the branch correctly resumes execution and manages stack values appropriately. Constraints checked: precise label index resolution, proper operand restoration.

(assert_invalid
  (module
    (func $nested-if-block
      (block $outer
        (block $inner
          (if (i32.const 1)
            (then (br $outer))
          )
        )
      )
    )
  )
  "type mismatch"
)