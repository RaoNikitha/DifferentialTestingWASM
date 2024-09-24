;; 3. **Test Loop with Branch in If**:    Inside a loop, use an `if` instruction with a branch pointing to the loop's scope. Ensure the context accurately resolves the branch to the loop header, preventing misinterpretation that could lead to infinite loops or incorrect breaks.

(assert_invalid
  (module (func $test (loop (if (i32.const 1) (then (br 1)))))
  )
  "type mismatch"
)