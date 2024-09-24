;; 2. **Multiple `unreachable` instructions within a `block`:**    - **Description:** Embed several `unreachable` instructions at various points within a block to test if the stack is handled correctly upon multiple traps.    - **Constraint:** Each `unreachable` should cause a trap, preventing subsequent instructions from modifying the stack.    - **Relation to Stack Corruption:** Validates stack integrity with sequential interruptions.

(assert_invalid
  (module 
    (func $multiple-unreachable-in-block
      (block
        (unreachable)
        (i32.const 1)
        (unreachable)
        (i32.add)
      )
    )
  )
  "instruction after unreachable"
)