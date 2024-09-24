;; 1. **Test Description**: A nested `loop` within another `loop` with `br` instruction that targets the outer loop after several iterations.     - **Constraint Checked**: This checks for correct label indexing and context extension within nested loops.    - **Relation to Mismanagement of Block Nesting**: Mismanagement may result in the branch misreferencing the intended outer loop.

(assert_invalid
  (module
    (func $nested_loop_branching
      (i32.const 0)
      (loop (param i32)  ;; outer loop
        (loop (param i32)  ;; inner loop
          (br 1)   ;; branch to outer loop
        end)
      end)
    )
  )
  "type mismatch"
)