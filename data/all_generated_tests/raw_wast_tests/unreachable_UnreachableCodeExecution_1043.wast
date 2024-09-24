;; 4. **Unreachable in Nested Blocks:**    - **Description:** Nest multiple blocks with an `unreachable` instruction in the innermost block. Ensure the program traps as soon as `unreachable` is reached.    - **Constraint:** Checks nested block terminations.    - **Relation to Unreachable Code Execution:** Ensures that nested control structures properly handle `unreachable`.

(assert_invalid
 (module
  (func $nested-blocks-with-unreachable
   (block
    (block
     (block
      (unreachable)
     )
     (i32.const 1)
    )
    (i32.const 2)
   )
   (drop)
  )
 )
 "type mismatch"
)