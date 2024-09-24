;; 4. **Test with Deeply Nested Loops and Blocks**:     - Construct deeply nested loops and blocks with intervening `nop` instructions. Employ branch instructions to exit multiple nested levels and check the control flow consistency.    - This test identifies if the `nop` instruction avoids issues in deeply nested structures, which can complicate block exits due to misinterpreted block depths.

(assert_invalid
  (module
    (func $deeply_nested
      (loop $L1
        (loop $L2
          (block $B1
            (nop)
            (br 0)
          )
          (nop)
          (br 1)
        )
        (br 1)
      )
    )
  )
  "type mismatch"
)