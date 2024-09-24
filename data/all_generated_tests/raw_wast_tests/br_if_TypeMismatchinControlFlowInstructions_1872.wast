;; 3. **Test 3**:    - **Description**: An `if` block with a result type `i32` and a `br_if` within the if-else structure that attempts to branch using an `i64` comparison value.    - **Constraint**: Verifies the type matching when `br_if` is used within an if-else structure.    - **Relation to Type Mismatch**: Tests for type adherence within conditional branches and their enclosing structures.

(assert_invalid
 (module
  (func $type-if-else-br_if (result i32)
   (block (result i32)
    (i32.const 0)
    (if (result i32)
     (then
      (br_if 0 (i64.const 1))
     )
     (else
      (i32.const 1)
     )
    )
   )
  )
 )
 "type mismatch"
)