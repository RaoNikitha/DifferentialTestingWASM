;; Test 3: Design a nested block scenario where an inner block has an implicit label and branches to an outer block. This should validate correct indexing and label resolution within the control flow.

(assert_invalid
  (module (func $nested-block-labels
    (block (result i32)            ;; outer block with an implicit label
      (block                        ;; inner block with an implicit label
        (br 1 (i32.const 42))       ;; branch to the outer block
      )
      (i32.const 0)                 ;; subsequent inner block instructions
    )
    (unreachable)
  ))
  "type mismatch"
)