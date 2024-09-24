;; 5. **Test Description:**    - Construct a nested loop with a `br` inside a conditional block such that the branch is only taken when a complex criterion is met. Ensure the outer loop condition changes per iteration.    - **Constraint:** This checks the structured control flow enforcement and ensures the `br` does not jump to incorrect positions, avoiding infinite loops from misplaced control flow.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (block (result i32)
          (br_if 1 (i32.eqz (i32.rem_s (get_local 0) (i32.const 3))))
          (call $dummy_func)
          (br 0)
        )
        (i32.sub (get_local 0) (i32.const 1))
        (br_if 0 (i32.gt_s (get_local 0) (i32.const 0)))
      )
    )
  )
  "unknown label"
)