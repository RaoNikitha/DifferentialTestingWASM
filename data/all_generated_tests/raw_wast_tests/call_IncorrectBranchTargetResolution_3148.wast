;; 7. **Test 7**: Define a function with deeply nested blocks where an inner block incorrectly branches to a label in a sibling block. Execute this function to verify differentiation between WebAssembly and Wizard_engine in terms of branch target validation and error handling.

(assert_invalid
  (module
    (func $nested-blocks
      (block $outer
        (block $inner-sibling
          (br $outer)
          (br $inner) ;; Branch to a non-existent label
        )
      )
    )
  )
  "unknown label"
)