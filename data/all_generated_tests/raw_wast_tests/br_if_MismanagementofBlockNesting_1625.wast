;; 6. **Test 6**: - **Description**: Deeply nested `loop` structures with `br_if` targeting an outer loop, rather than the immediate enclosing loop. - **Constraint Checked**: Correct handling of relative label indices in `br_if` instruction.

(assert_invalid
  (module (func $deeply-nested-loop
    (loop (loop (loop (loop (loop (loop (loop (br_if 6 (i32.const 1)))))))))
  ))
  "unknown label"
)