;; 6. **Test Description:** Embed a `br_table` inside an `if` control structure with multiple labels branched differently based on stack operand values. The test detects if conditional branching adheres correctly to the operand evaluation, identifying misbranches.

(assert_invalid
  (module
    (func $conditional-branch-misbranch (param i32) (result i32)
      (local i32)
      (block (result i32)
        (if (result i32)
            (local.get 0)
            (then
              (local.set 1 (i32.const 10))
              (br_table 1 0 (local.get 1))
            )
            (else
              (local.set 1 (i32.const 20))
              (br_table 0 1 (local.get 1))
            )
        )
      )
    )
  )
  "type mismatch"
)