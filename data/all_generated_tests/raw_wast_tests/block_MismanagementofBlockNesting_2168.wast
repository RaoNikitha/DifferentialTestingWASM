;; 9. **Test 9**:    Design nested blocks with mismatched `end` delimiters and see how each engine handles the nesting imbalance. This checks if the engine can catch improper nesting errors and manage block/catch mismatches.

(assert_malformed
  (module quote
    "(func
       (block (result i32)
         (i32.const 0)
         (block (result i32))
       end))
  )
  "mismatched end delimiter"
)