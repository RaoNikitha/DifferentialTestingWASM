;; 5. **Nested Control Structures with `nop`**:    Insert `nop` at different points within nested control structures with intertwined `br_if` conditions. Check whether the correct control paths are followed, ensuring `nop` does not influence the condition evaluations.

(assert_invalid
  (module
    (func
      (block
        (loop
          (br_if 0 (nop))
          (br_if 1 (nop))
        )
      )
    )
  )
  "type mismatch"
)