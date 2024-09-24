;; 4. Embed `nop` instructions inside a loop, specifically before a `br_if` loop exit condition. Validate if the loop exit condition is respected or not, highlighting potential issues with conditional evaluation.

(assert_invalid
  (module
    (func $br_if_with_nop
      (block $exit
        (loop $loop
          (nop)
          (br_if $exit (i32.const 1))
        )
      )
    )
  )
  "invalid instruction"
)