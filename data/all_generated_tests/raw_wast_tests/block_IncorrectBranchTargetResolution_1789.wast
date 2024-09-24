;; 10. **Label Stack Integrity**: Nested blocks with sequentially increasing complexity and branches (`br_table`) that target specific label indices. This checks if `wizard_engine` maintains the integrity of the label stack during control flow operations.

(assert_invalid
  (module (func $label-stack-integrity
    (block (result i32)
      (block (result i32)
        (br_table 0 1 0 (i32.const 0))
        (i32.const 1) (drop)
      )
      (i32.const 2) (drop)
    )
  ))
  "type mismatch"
)