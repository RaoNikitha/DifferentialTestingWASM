;; Define a block containing a few arithmetic instructions, followed by a nested block. Use a `br_if` instruction within the nested block to conditionally branch to the starting block. This test confirms whether conditional branching correctly resolves to the intended block.

(assert_invalid
  (module (func (result i32) 
    (block (result i32) 
      (i32.const 10) 
      (block (result i32) 
        (i32.const 5) 
        (i32.eqz) 
        (br_if 1)
      ) 
    )
  ))
  "type mismatch"
)