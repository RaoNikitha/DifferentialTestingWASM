;; 9. Create a `nested block` where the inner block alters the stack type (pushes `i32`) and ends with `unreachable`. Ensure the outer block correctly interprets type disruption from the inner block's trap.

(assert_invalid
  (module (func $nested-block-type-disruption
    (block (result i32) 
      (block 
        (i32.const 42) 
        (unreachable)
      ) 
    )
  ))
  "type mismatch"
)