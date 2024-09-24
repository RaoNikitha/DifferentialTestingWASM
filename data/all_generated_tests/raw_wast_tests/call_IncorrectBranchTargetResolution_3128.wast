;; - Test 7: Set up a sequence of nested function calls where each function ends with a `br_if` instruction to jump based on stack values. Validate the resolution of each branch target within their respective calling context.

(assert_invalid
  (module
    (func $outer (call $inner (i32.const 1)))
    (func $inner
      (block
        (br_if 0 (local.get 0))
      )
    )
  )
  "type mismatch"
)