;; 3. **Test Description:**    - A `loop` containing several `block` instructions, with a `br` that mistakenly targets an outer label beyond the current `loop`. Check for `unreachable` code execution.    - **Constraint: Nesting Constraints**    - **Differential Behavior: The Wizard Engine's proper indexing should prevent out-of-bounds label jumps, but WebAssembly might incorrectly execute `unreachable`.**

(assert_invalid
  (module
    (func $invalid-branch
      (loop $loop_label
        (block $inner_block
          (block
            (br 2)  ;; Mistakenly targets an outer label beyond the current loop
          )
        )
      )
    )
  )
  "unknown label"
)