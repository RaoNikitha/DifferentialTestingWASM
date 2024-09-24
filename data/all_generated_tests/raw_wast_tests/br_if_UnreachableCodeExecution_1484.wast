;; 5. **Test 5**: Design a scenario where a `br_if` instruction branches to a label depth just above its valid bounds. Include an `unreachable` instruction in the body following the `br_if` to verify if execution erroneously continues without triggering the branch or error.

(assert_invalid
 (module (func $br_if-label-depth-out-of-bounds
   (block (block (br_if 2 (i32.const 1)))))
)
 "unknown label"
)