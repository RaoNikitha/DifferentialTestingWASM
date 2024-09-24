;; 7. **Operand Stack Height Consistency Test:**    - Have a `br` instruction inside an `if`-`else` block where the branch targets an outer block. Check if the operand stack height is consistently managed during the branch transition.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (i32.const 1)
        (if (result i32)
          (then (block (br 1) (i32.const 1)))
          (else (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)