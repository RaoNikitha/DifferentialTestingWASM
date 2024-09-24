;; 8. **Test Description**: Devise a loop structure containing several nested levels, each utilizing `br_if` for conditional branch evaluations. Induce conditions where incorrect operand management results in an excessive unwound stack for outer loops.   - **Constraint Being Checked**: Management of stack height and operand types for deeply nested loop structures.   - **Stack Corruption Aspect**: Improper stacking/unstacking during nested loop branches can induce underflows or superfluous stack entries.

(assert_invalid
  (module
    (func $nested-loops
      (block
        (loop
          (block
            (br_if 2 (i32.const 0)) ;; Targeting the outermost block in nested loops
            (loop
              (block
                (br_if 2 (i32.const 1)) ;; Incorrect label causing stack issues
                (br_if 2 (i32.const 0)) ;; Valid test for proper validation
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)