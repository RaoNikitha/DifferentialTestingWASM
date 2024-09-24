;; 9. **Mismatched Type in Breaks with Early Return**: Craft a function with a `br` (break) targeting blocks of differing types, such as returning `i64` in a block that should produce `f32`. This evaluates if the return correctly respects type constraints across breaks.

(assert_invalid
  (module
    (func $type-mismatch-on-break (result f32)
      (block (br 0 (return (i64.const 42))))
    )
  )
  "type mismatch"
)