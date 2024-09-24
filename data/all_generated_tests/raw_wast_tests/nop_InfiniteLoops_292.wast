;; Test 3: Embed a `nop` instruction in nested loops with `br` and `br_if` control instructions. Validate if the control flow transitions between loops correctly without infinite looping.

(assert_invalid
  (module 
    (func $test 
      (block 
        (loop 
          (nop)
          (br 1)
          (br_if 1 (i32.const 0))
        )
      )
    )
  )
  "unexpected end of section or function"
)