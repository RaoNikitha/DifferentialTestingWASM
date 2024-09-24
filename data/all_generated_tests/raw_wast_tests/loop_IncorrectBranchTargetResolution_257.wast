;; Test 8: Sequentially nested loops with a `br` instruction in the innermost loop targeting an outer loop's label. Incorrect backward jump target resolution will result in jumping out prematurely or other unwanted behaviors.

(assert_invalid
  (module
    (func $nested-loop-test
      (i32.const 0)
      (loop (result i32)
        (loop (result i32)
          (br 1)
        )
      )
    )
  )
  "unknown label"
)