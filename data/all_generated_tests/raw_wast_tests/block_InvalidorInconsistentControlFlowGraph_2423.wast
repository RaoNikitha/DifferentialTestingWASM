;; 4. Develop a block with an entry sequence of type-changing instructions followed by a jumping instruction that could potentially produce an incorrect stack state if the block type validation is mishandled in deeper contexts. This ensures robust operand stack behavior and type validation.

(assert_invalid
  (module 
    (func $block-entry-type-mismatch (result i32)
      (block (result i32)
        (i32.const 1) 
        (f32.const 1.0) 
        (br 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)