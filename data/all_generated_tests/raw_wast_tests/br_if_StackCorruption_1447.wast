;; 8. **Nested Control Flow Stack Restoration**:    - **Description**: Create a series of nested `block`, `loop`, and `if` instructions where `br_if` manipulates the stack deeply. Confirm stack is unwound and restored correctly when branching occurs.    - **Constraint Checked**: Nested flow stack unwinding.    - **Relation to Stack Corruption**: Examines deep nested flow integrity on stack.

(assert_invalid
 (module
  (func $nested_control_flow
   (block (result i32)
    (loop (result i32)
     (block
      (block
       (block
        (if (i32.const 1)
         (then
          (br_if 4 (i32.const 1))
         )
        )
       )
      )
     )
    )
   )
   (i32.const 0)
  )
 )
 "unknown label"
)