;; A test where nested blocks have varying blocktypes, and a branch instruction ensures exit conformity with those blocktypes. This checks the correct adjustment and verification of stack states based on block types.

(assert_invalid
  (module (func $nested-blocks-mismatch-stack
    (block (result i32) 
      (block (result f32)
        (br 0 (i32.const 42)) 
      ) 
      (i32.const 1)
    )
  ))
  "type mismatch"
)