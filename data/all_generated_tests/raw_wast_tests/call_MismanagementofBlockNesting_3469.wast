;; 8. **Function Calls at Various Depths in Nested Blocks**:    - Use function calls systematically placed at various nested block depths. Ensure each nested call returns to the correct nesting level.    - Check if the index lookup impacts nested block returns.

(assert_invalid
  (module
    (func $nested-call (block (block (block (call 1)))))
    (func (result i32) (i32.const 0))
  )
  "block type mismatch"
)