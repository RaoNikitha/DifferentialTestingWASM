;; 4. Construct an `if` block without an `else` branch but include a forward `br` instruction inside the `if` body that tries to jump to a label defined outside the block, testing how the CFG manages unresolvable forward branches.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (if (result i32) (i32.const 1)
          (then (br 1 (i32.const 42)) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)