;; Test 8: Implement a control flow where a block specifies a valid result type but include a `br_if` instruction that incorrectly assumes a different type for the result value. Validate if the branch conditional correctly enforces the result type.

(assert_invalid (module (func $mismatched-br_if (result i32) (block (result i32) (br_if 0 (i64.const 1) (i32.const 0))) )) "type mismatch")