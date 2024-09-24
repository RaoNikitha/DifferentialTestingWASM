;; 9. Use nested blocks where the outer block expects `[]`, and the inner block improperly ends with an `i32` value. This complex nesting test verifies both implementations' handling of mismatched return values propagating outward from nested blocks.

(assert_invalid
  (module (func $nested-block-mismatch (result i32)
    (block
      (block (result i32)
        (i32.const 42)
      )
    )
  ))
  "type mismatch"
)