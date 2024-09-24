;; 2. **Test 2: Multiple Nested Blocks**    - **Description:** A nested block structure (`block` within another `block`) with a `br_if` targeting the outer block.    - **Constraint Checked:** The correct unwinding of the stack and control transfer to the outer block.    - **Mismanagement Relation:** Correct handling of deeper nesting levels when conditionally branching to a non-immediate enclosing block.

(assert_invalid
  (module 
    (func $nested-block 
      (block 
        (block 
          (br_if 1 (i32.const 1)))))
  )
  "type mismatch"
)