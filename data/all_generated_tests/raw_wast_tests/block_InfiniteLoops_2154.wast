;; 5. **Test Loop With Incorrect Label**: Create a block and use branching instructions (`br`) targeting wrong or non-existent labels, causing one engine to iterate infinitely while the other catches the error.

(assert_invalid
  (module (func $test-loop-incorrect-label
    (block (result i32)
      (br 2 (i32.const 42))
    )
  ))
  "unknown label"
)