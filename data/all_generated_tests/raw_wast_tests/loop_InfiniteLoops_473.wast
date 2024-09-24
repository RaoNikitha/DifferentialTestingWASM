;; 4. **Test Description**: Incorporate a nested `loop` within another `loop`, with an intentional mistake where `br` or `br_if` targets the wrong nested scope. This checks if nested loop indices and labels are correctly handled to ensure proper loop behavior.    **Constraint**: Verifying correct label and index handling for nested loops.    **Infinite Loop Relevance**: Ensures nested loops do not cause indefinite execution due to scope errors.

(assert_invalid
 (module (func $nested-loop-invalid-branch
   (loop (result i32)
     (loop (result i32)
       (br 2) ;; Invalid: should target only a loop in the current or outer scope
     )
   )
 ))
 "type mismatch"
)