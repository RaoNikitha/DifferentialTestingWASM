;; 7. **Test Description:**    Multiple nested `block` and `loop` structures containing both `unreachable` and valid `return` instructions ending with a `br_table`.    - **Constraint Checked:** Checks if the return statements within nested blocks and the `br_table` correctly avoid continuation when `unreachable` appears.    - **Relation to Mismanagement of Block Nesting:** Tests if the nesting layers are appropriately closed down to top-most levels upon trap, ensuring no unintended loop exits.

(assert_invalid
  (module
    (func $nested-unreachable-br_table
      (block (result i32)
        (loop (result i32)
          (block
            (br 2 (i32.const 1))
            (unreachable)
          )
          (br_table 0 #0)
        )
      )
    )
  )
  "type mismatch"
)