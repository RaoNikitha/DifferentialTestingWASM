;; 6. **Test Description**:    Design a module where nested conditional branches (`if`, `else`) within nested blocks utilize `br` instructions that should branch out conditionally based on stack values. Check if the implementations handle nesting correctly by ensuring the blocks and conditions are correctly managed.

(assert_invalid
  (module (func $nested-blocks-conditional-branching
    (block $outer (result i32) 
      (i32.const 1) 
      (block $inner 
        (i32.const 2)
        (if (result i32)
          (i32.eq (i32.const 1) (i32.const 1)) 
          (then
            (br 1 (i32.const 3)) 
          )
          (else
            (br 0 (i32.const 4)) 
          )
        )
      )
      (drop)
    )
  ))
  "type mismatch"
)