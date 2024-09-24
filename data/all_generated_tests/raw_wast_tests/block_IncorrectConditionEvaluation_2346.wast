;; 7. Formulate an enclosing block and an inner block where the inner block conditionally returns a value using `br_if`. Test if the condition evaluation within the inner block correctly influences the control transfer to resume at the outer block.

(assert_invalid
  (module (func $conditional-branching-blocks (result i32)
    (block (result i32) 
      (block (result i32) 
        (br_if 1 (i32.const 1))
        (i32.const 2)
      )
      (i32.add (i32.const 3))
    )
  ))
  "type mismatch"
)