;; 6. **Deeply Nested If-Else with Branches:**    Create a complex nested `if-else` structure and have `br` instructions break to various levels of blocks or to the start of other conditional blocks. Ensure the operand stack is correctly managed throughout the branching.

(assert_invalid
 (module
  (func $deeply_nested_if_else_with_br (param i32) (result i32)
   (block (result i32)
    (block (result i32)
     (block (result i32)
      (if (result i32) (local.get 0)
       (then
        (if (result i32) (i32.const 1)
         (then (br 1))
         (else (br 2))
        )
       )
       (else
        (if (result i32) (i32.const 0)
         (then (br 0))
         (else (i32.const 42))
        )
       )
      )
     )
    )
   )
  )
 )
 "type mismatch"
)