;; Use nested `if` instructions where the inner `if` leaves an incorrect stack height that the outer `if` must handle. This tests nested context and label handling, ensuring proper stack height management across nested blocks.

(assert_invalid
  (module
    (func $nested-if-stack-mismatch
      (if (result i32) (i32.const 1)
        (then (if (result i32 i32)
          (i32.const 0)
          (then (i32.const 1) (i32.const 2))
        ))
      )
    )
  )
  "type mismatch"
)