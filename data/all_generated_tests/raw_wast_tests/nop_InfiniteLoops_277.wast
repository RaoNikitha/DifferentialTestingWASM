;; 8. Insert multiple `nop` instructions within a loop that performs recursive `br_if` calls to self. Ensure that `nop` does not interfere with the recursive call exit conditions.

(assert_invalid
  (module
    (func $test-loop
      (loop $label
        nop
        (br_if $label (i32.const 0))
        nop
      )
    )
  )
  "expression result type mismatch"
)