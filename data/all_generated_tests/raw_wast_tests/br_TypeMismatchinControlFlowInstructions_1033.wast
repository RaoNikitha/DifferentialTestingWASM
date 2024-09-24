;; Test 4: Implement an if structure that outputs a boolean value and within the if branch, use br to try to branch with an integer type instead of a boolean.

(assert_invalid
  (module
    (func $type-branch-mismatch-if
      (block
        (if (result i32) (i32.const 1) (then (br 0)))
      )
    )
  )
  "type mismatch"
)