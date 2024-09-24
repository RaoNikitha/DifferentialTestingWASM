;; - **Test 10:**    A nested loop where a `br` instruction within the innermost loop incorrectly references an outer loop or higher nesting depth, causing the inner loop always to branch back to its beginning, resulting in infinite looping.

(assert_invalid
  (module
    (func $nested-loop-br
      (loop $outer (result i32)
        (loop $inner (result i32)
          (br 2)
          (i32.const 0)
        )
      )
    )
  )
  "invalid branch depth"
)