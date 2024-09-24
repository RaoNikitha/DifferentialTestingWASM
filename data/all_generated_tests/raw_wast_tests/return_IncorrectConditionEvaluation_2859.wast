;; 8. Test for a false condition forcing `br_if` to jump to an invalid/unreachable block to ensure proper catch and error handling. Misbranching will reveal condition and block validation issues.

(assert_invalid
  (module
    (func $test-br_if-unreachable
      (block $label
        (br_if $label (i32.const 0))
        (return (i32.const 42))
      )
    )
  )
  "type mismatch"
)