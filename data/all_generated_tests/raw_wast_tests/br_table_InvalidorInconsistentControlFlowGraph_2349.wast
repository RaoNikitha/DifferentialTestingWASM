;; Test 9: Develop a test scenario where `br_table` leads into another `br_table` instruction in a nested loop, ensuring the state changes are correctly maintained across nested control transfers. - **Constraint Tested**: State change correctness across nested `br_table` instructions.

(assert_invalid
  (module
    (func $nested-br-tables
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (br_table 0 1 (br_table 0 1 (i32.const 0) (i32.const 1)))
          )
        )
      )
    )
  )
  "type mismatch"
)