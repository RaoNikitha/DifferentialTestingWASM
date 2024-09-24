;; 1. **Test Description**: Create a test involving nested `block` structures where a `br_if` targeting label `1` should break to the outer block under a true condition. Verify if the branch correctly escapes the nested structure or erroneously resolves to a wrong target.

(assert_invalid
  (module
    (func
      (block
        (block
          (br_if 1 (i32.const 1))
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)