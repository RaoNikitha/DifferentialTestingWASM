;; - **Test 2**:   Use a `loop` with a `br_if` instruction that logically should push an `i64` result but mistakenly has an `f64` type.   - **Reason**: Loop constructs might misinterpret types pushed by branches.   - **Constraint**: The correct stack type `[t*]` must be maintained based on the loop’s input type.

(assert_invalid
  (module
    (func
      (loop (result i64)
        (block (result i64)
          (br_if 1 (f64.const 1.0))
        )
        (i64.const 0)
      )
    )
  )
  "type mismatch"
)