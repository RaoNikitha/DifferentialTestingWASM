;; 9. **Test Redundant Unwind Actions:**    - Construct overlapping `br` instructions where one intentionally employs unnecessary stack unwinding. This tests if the implementation avoids redundant unwinding actions.

(assert_invalid
  (module
    (func $redundant-unwind-actions
      (block
        (i32.const 0) (i32.const 1) (i32.const 2)
        (br 0)
        (drop) (drop) (drop)
      )
    )
  )
  "redundant stack unwinding"
)