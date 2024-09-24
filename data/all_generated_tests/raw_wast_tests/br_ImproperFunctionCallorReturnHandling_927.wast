;; 8. **Test Description:** Design nested blocks where the inner block contains multiple `call` instructions, followed by a `br` targeting the outer block. Ensure that all function call returns are correctly unwound and managed by the branch.

(assert_invalid
  (module
    (func $multiple-calls-branch
      (block
        (block
          (call $some_function)
          (call $some_function)
          (call $some_function)
          (br 1)
        )
      )
    )
  )
  "unknown label"
)