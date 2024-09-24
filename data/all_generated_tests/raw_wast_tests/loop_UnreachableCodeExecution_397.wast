;; - Test Case 8: Implement a loop where an invalid branch target index is used, leading to an `unreachable` code if the error is not caught by correct context extension. This checks for precise label index management.

(assert_invalid
  (module (func $invalid-branch-target
    (block (loop (br 2)))
  ))
  "unknown label"
)