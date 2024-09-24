;; 7. **Test: Complex Conditional with Unreachable in Nested Blocks**    - **Description:** Design a complex function with mixed `if-else` constructs and nested `block` structures. Place `unreachable` in one of these nested blocks and use multiple `br` statements to observe state changes.    - **Constraint Checked:** Observes if `unreachable` influences state consistency in complex nested conditions correctly.    - **Relation to Mismanagement of Block Nesting:** Ensures nested block and conditional management are consistent with the presence of `unreachable`.

(assert_invalid
  (module
    (func $nested-if-blocks
      (block
        (if (result i32)
          (then
            (i32.const 1)
          )
          (else
            (block
              (unreachable)
              (i32.const 2)
            )
          )
        )
        (i32.const 3)
      )
      (i32.add)
    )
  )
  "type mismatch"
)