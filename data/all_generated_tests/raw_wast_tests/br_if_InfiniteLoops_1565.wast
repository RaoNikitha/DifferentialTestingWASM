;; 6. **Test 6**: A loop with a `br_if` that references an outer loop label incorrectly will lead to infinite loops if not correctly handled. The ambiguity in label indices should be addressed correctly.

(assert_invalid
  (module (func $incorrect-outer-loop-label
    (block (loop (br_if 2 (i32.const 1))))
  ))
  "unknown label"
)