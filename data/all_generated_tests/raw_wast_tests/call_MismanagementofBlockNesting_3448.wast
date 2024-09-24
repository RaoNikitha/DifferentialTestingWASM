;; 7. **Test 7**:    - **Description**: An initial block, loop, or if-else block nested within another block, where a function is called at different nesting levels with varying stack depths.    - **Constraint Checked**: Evaluates proper type-check maintenance with varying stack depths across nested structures.    - **Relation to Block Nesting**: Ensures the stack is correctly managed as control flow enters and exits nested blocks.

(assert_invalid
  (module
    (func $nested (param i32 i32 i32) (result i32)
      (local i32)
      (block $outer
        (loop $inner
          (block $mid
            (call 0)
          )
          (br $outer)
        )
      )
    )
    (func $dummy (param i32 i32) (result i32)
      (i32.add (local.get 0) (local.get 1))
    )
  )
  "type mismatch"
)