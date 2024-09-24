;; 2. **Test 2**: Create a function with nested loops, where one of the `br` instructions points to an incorrect depth that does not exist. Call the function and check whether both WebAssembly and Wizard_engine handle the invalid branch target consistently by validating the error thrown.

(assert_invalid
  (module
    (func $nested-loop
      (block $outer
        (loop $inner
          (br $nonexistent)  ;; incorrect depth
        )
      )
    )
    (func (call $nested-loop))
  )
  "unknown label"
)