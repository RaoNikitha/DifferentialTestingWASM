;; Test Description 9: A `block` instruction followed by multiple `br_if` instructions that evaluate different conditions sequentially. Verify that each `br_if` respects its specific condition and branches correctly based on its own unique condition check.

(assert_invalid
  (module (func $test-multiple-br_if
    (i32.const 0) (block (result i32)
      (i32.const 1) (br_if 0)
      (i32.const 0) (br_if 0)
      (i32.const 1) (br_if 0) (drop)
    )
  ))
  "type mismatch"
)