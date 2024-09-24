;; 8. **Test Description**: A loop structure with multiple hierarchical levels and a `br_if` instruction aimed to skip several intermediate loops to an outer block. Validate proper unwinding and correct control transfer.    - **Constraint Checked**: Correct context and label scope management for hierarchical control structures.    - **Relation to Infinite Loops**: Incorrect control transfer to outer blocks may result in the loop not breaking out efficiently, leading to infinite looping.

(assert_invalid
  (module (func $multiple-loops-hierarchical
    (block $outer (result i32)
      (loop $inner1
        (loop $inner2
          (br_if 0 (i32.const 1))
          (br_if 1 (i32.const 0))
        )
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)