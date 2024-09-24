;; 2. **Test Description**: Place a `br_if` inside a nested `block`. Use a non-zero condition and verify that the branch skips to the immediate outer block.

(assert_invalid
 (module (func $nested-br_if
   (block
     (block
       (i32.const 1) (br_if 0 (i32.const 1)) (unreachable)
     )
     (nop)
   )
  ))
 "type mismatch"
)