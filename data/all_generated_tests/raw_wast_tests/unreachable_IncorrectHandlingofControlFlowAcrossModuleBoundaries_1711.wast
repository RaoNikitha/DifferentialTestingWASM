;; 2. **Test Case 2: Unreachable in Imported Function within Loop**    - **Description:** Module A imports a function from Module B. Module B's function contains a loop with the `unreachable` instruction inside it. The test checks if the loop traps correctly and ensures the control flow returns to Module A without corruption.

(assert_invalid
  (module
    (import "moduleB" "funcB" (func $funcB))
    (func (call $funcB))
  )
  "type mismatch"
)

(module $moduleB
  (func $funcB
    (block
      (loop 
        (unreachable)
      )
    )
  )
)