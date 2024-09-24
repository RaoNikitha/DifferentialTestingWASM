;; 1. **Test Description**: Create a deeply nested structure with multiple `block` and `loop` constructs, and use `br 3` to jump out of the third innermost block. This tests the relative label lookup and ensures the correct block is targeted.    - **Constraint**: Verifies that the implementation correctly interprets relative label indexing and branches to the appropriate block.

(assert_invalid
  (module
    (func $deep-nested
      (block
        (block
          (loop
            (block
              (br 3)
            )
          )
        )
      )
    )
  )
  "unknown label"
)