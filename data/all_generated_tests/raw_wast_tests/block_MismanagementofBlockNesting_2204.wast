;; 5. Create a test with a `block` inside another `block`, where the inner `block` ends with `br` targeting the outer `block` followed by code in the outer `block`. Ensure that execution resumes correctly inside the outer `block` after the branch.

(assert_invalid
  (module 
    (func $nested-block-with-branch (result i32)
      (block (result i32)
        (block
          (br 1)
        )
        (i32.const 42)
      )
    )
  )
  "type mismatch"
)