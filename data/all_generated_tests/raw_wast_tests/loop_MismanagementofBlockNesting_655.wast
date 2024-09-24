;; 6. **Test Description**: A sequence of nested `block`, `loop` within a `block`, and another `loop`, with `br` and `br_if` instructions attempting to jump to various depths.    - **Constraint Checked**: Checks for correct branching logic in complex nested blocks.    - **Relation to Mismanagement of Block Nesting**: Incorrect label stacking can cause incorrect control flow especially in deeply nested blocks.

(assert_invalid
  (module 
    (func $nested-loop-depth
      (block (label $outer
        (loop (result i32)
          (block (label $inner
            (loop (result i32)
              (br_if $outer (i32.const 0)) 
              (i32.const 1)
            ))
            (br $inner)
          ))
          (br_if $outer (i32.const 0))
        ))
      ))
    ))
  "incorrect label reference"
)