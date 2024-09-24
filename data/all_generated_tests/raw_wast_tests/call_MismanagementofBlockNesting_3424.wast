;; 3. **Conditional Branch with Invalid Call**:    - **Description**: Create a module where a `call` instruction is inside a nested conditional branch with an invalid function index to see if the implementation properly handles the invalid call within the nesting.    - **Constraint**: Use an invalid function index within the innermost conditional block.    - **Relation to Mismanagement of Block Nesting**: This will test if the error is propagated correctly through nested conditional branches.

(assert_invalid
  (module
    (func $f (param i32))
    (func $g (param i32) (result i32)
      (if (i32.eqz (local.get 0))
        (then
          (call 99) ;; invalid function index
        )
      )
    )
  )
  "invalid function index"
)