;; 4. Embed `nop` within a nested loop structure, where the inner loop contains `br` instructions. Check if `nop` impacts the control flow and causes the outer loop to enter an infinite loop.

(assert_invalid
  (module
    (func (loop $outer 
            (loop $inner
              nop
              br $inner
            )
            br $outer
          )
    )
  )
  "unexpected end of section or function"
)