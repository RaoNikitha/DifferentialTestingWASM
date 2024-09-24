;; 9. **Mutual Nesting of Blocks and Loops with `nop`**:     - Design test with mutually nested structures such as blocks within loops and vice versa, each containing multiple `nop` instructions. Validate control flow integrity.    - This examines complex mutual nesting scenarios to ensure `nop` does not cause mismanagement in entering or exiting these structures.

(assert_invalid
  (module
    (func $mutual-nesting
      (block $outer-block
        (loop $inner-loop
          (nop)
          (block $nested-block
            (nop)
            (loop $nested-loop
              (nop)
            )
          )
          (nop)
        )
      )
    )
  )
  "unexpected end of section or function"
)