;; 10. An `if` statement within a loop where both the loop and `if-else` structure involves multiple `br_if` instructions that target the same or extended nested structure. This checks if the differential handling of conditionally taken branches interacts correctly across the nested limits.

(assert_invalid
  (module
    (func $nested-conditional-branches
      (loop $outer
        (if (i32.const 1)
          (then
            (br_if $outer (i32.const 1))
          )
          (else
            (br_if $outer (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)