;; 9. Formulate a `loop` block with several layers of nested conditionals and backward branches. Verify that branching always resolves to the correct labeled loop.

(assert_invalid
  (module (func $nested-branches-loop
    (result i32)
    (i32.const 0)
    (block (loop $l0 (result i32)
      (br_if $l0 (i32.const 1)) ;; Condition to branch within the loop
      (loop $l1 (result i32)
        (br_if $l1 (i32.const 1)) ;; Nested loop with conditional branch
        (block (loop $l2 (result i32)
          (br_if $l2 (i32.const 1))
          (block $exit (block
            (loop $l3 (result i32)
              (br_table $l2 $l1 $exit (i32.const 0)) ;; Indirect branch
            )
          ))
        ))
      ))
    ))
  ))
  "type mismatch"
)