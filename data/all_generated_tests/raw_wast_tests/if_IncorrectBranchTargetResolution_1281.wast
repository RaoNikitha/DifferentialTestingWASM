;; 2. **Test 2: Branch Skipping Intermediate Block**    - Branch within an `if` block intended to target the innermost block erroneously jumps to an outer `block`, skipping intermediate blocks.

(assert_invalid
  (module
    (func
      (block (block (if (i32.const 1) (then (br 3))))))
  )
  "invalid label"
)