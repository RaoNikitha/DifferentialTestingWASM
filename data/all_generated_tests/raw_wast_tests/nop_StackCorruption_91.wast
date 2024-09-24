;; 2. **Test Description**: Insert a `nop` instruction within a nested `block` and `loop` structure that includes multiple stack manipulations, ensuring the stack is correctly handled upon entering and exiting these control structures. Verify that the stack maintains integrity throughout the nested structures.

(assert_invalid
  (module
    (func $nested-block-loop
      (block $outer
        (loop $inner
          nop
          br $outer
        )
      )
    )
  )
  "type mismatch"
)