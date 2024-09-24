;; 5. Create a `block` where an inner `loop` includes a `br_if` depending on a value passed between the block and loop. Verify wizard_engine's stack handling fails to exit, resulting in an infinite loop.

(assert_invalid
  (module 
    (func $block-loop-br_if (result i32) 
      (block (result i32) 
        (loop (result i32) 
          (br_if 1 (i32.const 1)) 
          (br 0) 
        ) 
        (i32.const 0) 
      ) 
    )
  ) 
  "type mismatch"
)