;; 9. Build a block containing a combination of forward and backward branches with conditional exit points (`br_if`), ensuring the CFG correctly accounts for these paths and handles them accurately. This tests the coherent generation of control flow graphs in such scenarios.

(assert_invalid
  (module
    (func $test
      (local i32)
      (block $outer (result i32)
        (block $inner (result i32)
          (br_if 1 (i32.const 1)) ;; Conditional exit point
          (br 0) ;; Forward branch
          (return (i32.const 0))
        )
        (br 0) ;; Forward branch to outer block
        (br $inner) ;; Improper backward branch, should be invalid
      )
    )
  )
  "invalid branch"
)