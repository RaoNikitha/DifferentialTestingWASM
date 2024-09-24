;; 4. **Test Description**: Use a nested control structure with `block` and `loop` instructions, placing `nop` within these structures and a `br_table` referring to them.    - **Constraint**: Making sure `nop` has no effect on nested control labels.    - **Edge Case**: Confirming correct index resolution within nested control flow, ensuring no undefined behavior from `br_table`.

(assert_invalid
  (module
    (func $test-block-loop-nop
      (block $outer
        (loop $inner
          nop
          br_table $outer $inner
        )
      )
    )
  )
  "type mismatch"
)