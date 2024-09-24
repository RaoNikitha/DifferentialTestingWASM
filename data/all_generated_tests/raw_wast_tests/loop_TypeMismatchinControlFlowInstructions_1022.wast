;; 3. Define a nested `loop` instruction structure where an inner loop has a result type that does not conform to the outer loop's expected input type. Test for type mismatches propagated through nested loops.

(assert_invalid
  (module
    (func
      (i32.const 0)
      (loop (result i32)
        (i32.const 1)
        (loop (result f32) (f32.const 0.0) br 0)
        br 0
      )
    )
  )
  "type mismatch"
)