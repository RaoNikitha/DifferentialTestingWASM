;; 6. Test with nested loops where `br` and `return` instructions are interleaved. Ensure that the `return` terminating the deepest loop properly bypasses the surrounding loop contexts, verifying control flow beyond single loop structures.

(assert_invalid
 (module
  (func $nested-loops-test (result i32)
   (block
    (loop $outer
     (i32.const 1)
     (br_if $outer (i32.const 0))
     (loop $inner
      (i32.const 2)
      (br_if $inner (i32.const 0))
      (return)
     )
    )
   )
  )
 )
 "type mismatch"
)