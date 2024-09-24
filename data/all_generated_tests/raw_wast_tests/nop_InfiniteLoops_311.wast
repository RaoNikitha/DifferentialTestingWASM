;; 2. Within a `loop`, place a conditional `br_if` to exit the loop, followed by a `nop` instruction. If `nop` alters flow control, the loop may not exit as expected.

(assert_invalid
  (module
    (func $conditional_nop_loop
      (loop
        (br_if 0 (i32.const 0))
        (nop)
      )
    )
  )
  "unexpected end of code"
)