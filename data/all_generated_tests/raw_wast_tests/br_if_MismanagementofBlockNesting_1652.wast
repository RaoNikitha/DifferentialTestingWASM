;; 3. **Test Description**: Design a function with sequentially nested loops containing `br_if` instructions targeting outer loops. Verify that each nested `br_if` correctly resolves the control flow to the targeted loop.    - **Constraint Checked**: Accurate branch resolution to outer loop levels from within nested loops.    - **Relation to Mismanagement of Block Nesting**: Mismanagement may cause the branch to incorrectly jump to the innermost loop or beyond the expected loop.

(assert_invalid
 (module
  (func $nested-loops
   (loop $outer
    (loop $inner
     (br_if 1 (i32.const 1))
    )
   )
  )
 )
 "type mismatch"
)