;; Test 5: Position `nop` within a `br_if` (conditional break) destination, ensuring the break destination expects a stack type that mismatches with the current stack state post-`nop`. Verify type mismatch handling.

(assert_invalid
  (module
    (func $test
      (block $label
        (br_if $label (nop))
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)