;; 3. **Indirect Branch in Loop Leading to Unreachable**:    - Design a loop containing a `br_table` with indices that improperly resolve to an `unreachable` instruction. The branch table should cause a differential behavior if out of bounds.    - **Constraint**: Ensures that indirect branching is properly handled and that default targets are accurately managed.    - **Unreachable Code Execution**: Prevents erroneous indirect branch resolution leading to `unreachable`.

(assert_invalid
  (module
    (func
     (block $default
       (loop (result i32)
         (block (br_table 0 $default (unreachable)))
         (i32.const 1)
       )
     )
    )
  )
  "unreachable code"
)