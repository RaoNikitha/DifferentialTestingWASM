;; 10. A nested control structure where the deepest block returns an `i64`, but intermediate blocks expect `i32`. A `br` instruction tries to exit from the deepest block to an outer block, testing for correct label indexing and type matching.

(assert_invalid
  (module
    (func $nested-label-mismatch
      (block (result i32)
        (block (result i32)
          (block (result i64)
            (br 2 (i64.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)