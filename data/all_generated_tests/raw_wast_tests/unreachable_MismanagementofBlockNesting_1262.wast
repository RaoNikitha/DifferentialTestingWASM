;; 3. **Test: Conditional Branches with Unreachable**    - **Description:** Implement a function with an `if-else` construct, containing nested blocks where an `unreachable` instruction is placed within one of the branches. Include branch instructions (`br_table`) addressing the blocks.    - **Constraint Checked:** Ensures that conditional branches handle `unreachable` correctly without mismanagement of the stack or blocks.    - **Relation to Mismanagement of Block Nesting:** Validates correct control flow and block resolution in the presence of conditional constructs and `unreachable`.

(assert_invalid
  (module
    (func $conditional-unreachable
      (block
        (block
          (if (i32.const 1)
            (then 
              (unreachable)
            )
            (else 
              (br_table 0 1 (i32.const 0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)