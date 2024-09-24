;; 1. **Test of Simple Call Between Modules:**    - Import a simple function from module A to module B. In module B, use a `br` instruction within a `block` to break to the end of the block before calling the imported function. The goal here is to check if the control flow accurately handles the transition across module boundaries without corrupting the stack.    - **Constraint Checked:** Ensures the `br` instruction correctly handles operand stack management and the transition for a simple function call across modules.    - **Relation to Constraint:** Validates the proper indexing and popping of the stack during the module transition.

(assert_invalid
  (module
    (import "moduleA" "funcA" (func $funcA (result i32)))
    (func $test
      (block
        (br 0)
        call $funcA
      )
    )
  )
  "type mismatch"
)