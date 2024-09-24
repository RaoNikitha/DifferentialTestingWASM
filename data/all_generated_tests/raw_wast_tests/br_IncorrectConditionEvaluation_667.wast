;; 8. **Test Description**: Implement a structure where a `br_if` targets an `if-else` section ensuring the branch only occurs if a condition evaluates `true`, switching between execution paths based on the condition being evaluated correctly.

(assert_invalid
  (module
    (func $type-cond-in-if-else-block
      (block (result i32)
        (i32.const 1)
        (if (result i32)
          (then
            (br_if 0 (i32.const 1))
          )
          (else
            (i32.const 0)
          )
        )
        (i32.eqz) (drop)
      )
    )
  )
  "type mismatch"
)