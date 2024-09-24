;; 1. **Test Description:** Create a module that imports a function from another module. Place a `br` instruction targeting a loop inside the imported function. Check if the calling module correctly handles the loop backward jump.    - **Constraint:** Ensures correct handling of backward branch targets across module boundaries.    - **Relation:** Tests whether the stack remains consistent when control flow jumps to the beginning of a loop in an imported function.

(assert_invalid
  (module
    (import "mod" "func" (func $imported (result i32)))
    (func $test
      (block
        (loop
          (call $imported)
          (br 1)
        )
      )
    )
  )
  "label type mismatch"
)