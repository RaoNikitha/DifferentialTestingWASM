;; 2. Define a `block` with a specific result type, but use a series of nested conditions that lead to an `unreachable` instruction if the result type mismatches due to incorrect operand transfer and popping.

(assert_invalid
  (module (func $type-block-nested-unreachable
    (block (result i32) 
      (i32.const 1) 
      (block (result i32) 
        (block (result i32) 
          (br_if 0 (i32.const 0)) 
          (i32.const 2)
        ) 
        (unreachable)
      ) 
      (i32.const 3)
    )
  ))
  "type mismatch"
)