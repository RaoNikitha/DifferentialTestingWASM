;; - Test 10: Run a `br_table` instruction with indices derived from floating-point conversions, including edge cases like NaN or infinities, ensuring proper type casting and index handling in conversion scenarios.

(assert_invalid
  (module
    (func
      (block
        (f32.const nan) (i32.trunc_f32_s) (br_table 0 1)
      )
    )
  )
  "type mismatch"
)