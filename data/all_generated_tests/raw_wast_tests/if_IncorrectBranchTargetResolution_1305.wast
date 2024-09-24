;; 6. **Test Cross If Block Branch Resolution**:    Place branches in one `if` block that target a different `if` block under different contexts, ensuring the branch label does not mistakenly jump to unrelated control instruction blocks.

(assert_invalid
  (module (func
    (block (if (i32.const 1) (then (br 1)) (else (br 1))))
  ))
  "type mismatch"
)