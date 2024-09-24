;; 2. Design a nested `loop` structure where the inner loop contains a `nop` followed by an `f32.const` and `f32.mul`. Return the result from the inner loop and ensure the types are correctly maintained. The test ensures `nop` does not interfere with type validation within nested loops.

(assert_invalid
  (module
    (func
      (loop
        (loop
          nop
          f32.const 1.0
          f32.mul
          br 1
        )
        drop
      )
      (result f32)
    )
  )
  "type mismatch"
)