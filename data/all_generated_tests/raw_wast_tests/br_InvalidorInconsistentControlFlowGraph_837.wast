;; 8. Branch with inconsistent operand stack:    Create a case where there are multiple nested blocks with varying operand stack heights, and a `br` instruction disrupts this by targeting a label with mismatched stack requirements. This will test the CFG regarding operand management and stack unwinding.

(assert_invalid
  (module
    (func $branch-with-inconsistent-stack
      (block
        (i32.const 1) 
        (block
          (block
            (i32.const 2)
            (br 1)
          )
        )
        (drop)
      )
    )
  )
  "type mismatch"
)