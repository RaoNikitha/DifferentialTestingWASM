;; 7. Implement a `block` containing an `end` instruction with an `f64` preceding it, while the block expects `i32`, checking if the invalid type presence at block termination is captured.

(assert_invalid
  (module
    (func
      (block (result i32)
        (f64.const 0.0)
        (end)
      )
    )
  )
  "type mismatch"
)