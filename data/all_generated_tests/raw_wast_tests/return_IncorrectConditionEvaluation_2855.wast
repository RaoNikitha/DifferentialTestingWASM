;; 4. Test nested `br_if` instructions where outer `br_if` is false and inner `br_if` is true. Incorrect handling should misnavigate resulting in incorrect path.

(assert_invalid
  (module
    (func $nested_br_if (result i32)
      (block
        (block
          (br_if 1 (i32.const 0))
          (br_if 0 (i32.const 1))
        )
        (return (i32.const 42))
      )
    )
  )
  "type mismatch"
)