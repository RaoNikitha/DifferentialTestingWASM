;; 10. Place `nop` in a loop where control flow is directed using labels and `br` instructions. Make sure `nop` does not affect label targeting and the loop maintains proper execution without entering an infinite loop.

(assert_invalid
  (module
    (func $test-loop
      (block $label1
        (loop $label2
          (nop)
          (br $label1)
        )
      )
    )
  )
  "malformed"
)