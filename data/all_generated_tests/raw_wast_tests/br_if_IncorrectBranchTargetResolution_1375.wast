;; 6. **Test Description 6: Incorrect Forward Branch in Nested Loops**    - Define nested loops where `br_if` within the inner loop targets `0`, expecting a backward jump, then test if it mistakenly targets the incorrect loop or block.

(assert_invalid
  (module
    (func
      (loop (result i32)
        (loop (result i32)
          (br_if 0 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)