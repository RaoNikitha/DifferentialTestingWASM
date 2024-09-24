;; 9. **Test: Unreachable Inside Multiple Nested Block Constructs**    - **Description:** Design a function with a combination of multiple `block` and `loop` constructs, including varying depths and interleaving. Place `unreachable` inside one of these layered constructs at different points.    - **Constraint Checked:** Ensures `unreachable` causes traps correctly within highly nested and interleaved constructs.    - **Relation to Mismanagement of Block Nesting:** Validates the handling of deeply nested constructs, ensuring `unreachable` maintains expected flow control.

(assert_invalid
  (module 
    (func $nested-unreachable
      (block 
        (loop 
          (block 
            (block 
              (unreachable)
              (i32.const 1)
            )
          )
          (i32.const 2)
        )
      )
    )
  )
  "type mismatch"
)