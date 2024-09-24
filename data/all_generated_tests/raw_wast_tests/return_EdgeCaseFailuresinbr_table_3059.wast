;; Combine `br_table` with a mix of reachable and unreachable code paths prior to the `return` instruction. This focuses on how both implementations manage the stack under complex branching leading to function termination.

(assert_invalid
 (module
  (func $br_table-return (result i32)
   (block (result i32)
    (block (result i32)
     (i32.const 1)
     (br_table 0 0 1)
     (i32.const 2)
     (return (i32.const 3))
     (unreachable)
    )
    (i32.const 4)
   )
  )
 )
 "type mismatch"
)