;; Use a loop structure where `nop` instructions appear before a `br_if` based on a loop counter. Check if the loop terminates properly.

(assert_malformed
  (module 
    (func $test_loop
      (loop $outer
        (nop)
        (nop)
        (br_if $outer (i32.const 0))
      )
    )
  )
  "unexpected end of section"
)