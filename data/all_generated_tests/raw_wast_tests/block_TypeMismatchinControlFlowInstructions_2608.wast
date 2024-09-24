;; Test 9: Generate a block with an `i64` result target but has a non-matching branch destination that pushes an `f64` value instead. This checks if the implementation correctly identifies and rejects type mismatches in control transfers targeting the block label.

(assert_invalid
  (module (func $type-mismatch-branch-target (result i64)
    (block (result i64) (br 0 (f64.const 1.0)))
  ))
  "type mismatch"
)