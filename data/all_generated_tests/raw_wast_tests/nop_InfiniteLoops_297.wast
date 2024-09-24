;; Test 8: Create a loop that includes `nop` and has complex control flow with multiple `br` and `br_if` instructions. Ensure that `nop` does not cause improper infinite loops under these conditions.

(assert_invalid
  (module
    (func $test-loop
      (loop $loop
        nop
        (br_if $loop (i32.const 0))
        (br $loop)
        (br $loop)
      )
    )
  )
  "type mismatch"
)