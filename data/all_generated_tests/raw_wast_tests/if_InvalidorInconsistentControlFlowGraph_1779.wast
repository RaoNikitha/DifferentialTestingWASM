;; 10. Create an `if` block where the `else` segment contains another `if` without an `end` keyword, testing the CFG's ability to detect and report incomplete nested structures.

(assert_malformed
  (module
    (func $incomplete-nested-if
      (i32.const 1)
      (if (result i32)
        (then (i32.const 0))
        (else 
          (if (result i32) (then (i32.const 1)))
      ))
    )
  )
  "unexpected end of section or function"
)