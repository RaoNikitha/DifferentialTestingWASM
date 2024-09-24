;; 5. **Test Description:**    - Create a nested `block` within another `block`, each with different local variables and stack manipulations.    - Place a `return` instruction in the inner block and verify the outer block’s local variables are not incorrectly influenced.    - **Specific Constraint:** Mismanagement of local context preservation across nested blocks when invoking `return`.

(assert_invalid
  (module
    (func $test (param i32) (result i32)
      (local i32)
      (block (result i32)
        (block
          (i32.const 1)
          (return)
        )
        (local.get 0)
      )
    )
  )
  "type mismatch"
)