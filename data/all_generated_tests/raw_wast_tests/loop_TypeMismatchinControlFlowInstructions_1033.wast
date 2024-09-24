;; 4. **Test with Faulty Branch Return Types**: Include a `br` instruction within a `loop` targeting a previous block or loop, where the branch assumes an invalid type, such as `[i64]` when the target expects `[i32]`. This test ensures branches correctly validate target block types.

(assert_invalid
  (module
    (func (result i32)
      (loop (param i32)
        (br 0 (i64.const 1))
      )
    )
  )
  "type mismatch"
)