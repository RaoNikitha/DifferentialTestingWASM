;; 9. **Test with Function Producing Side Effects**    - Write a function that produces side effects altering the stack and then immediately performs a return.    - Evaluate how return restores stack state after side effects.    - Relates to ensuring side effects do not interfere with the expected stack unwinding behavior.

(assert_invalid
  (module
    (global $y (mut i32) (i32.const 0))
    (func $side_effect_return (result i32)
      (i32.const 42)
      (global.set $y)
      (return)
      (global.get $y)
    )
  )
  "type mismatch"
)