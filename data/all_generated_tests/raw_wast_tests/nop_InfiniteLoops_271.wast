;; 2. Insert `nop` instructions within a loop containing `br_if` conditions that should break the loop. Ensure that `nop` does not affect the condition evaluation, and the loop breaks as expected.

(assert_invalid
  (module
    (func $break-loop-nop
      (loop $label
        (nop)
        (br_if $label (i32.const 1))
      )
    )
  )
  "type mismatch"
)