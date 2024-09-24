;; 7. **Test Description 7:** Include an imported function in the middle of a nested block structure and use the `br` instruction to target a label defined outside these blocks. Verify that after calling and returning from the imported function, the control flow adheres to the intended label jump.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func $test
      (block $outer
        (block $inner
          (call $external_func)
          (br 1)
        )
      )
    )
  )
  "label index out of range"
)