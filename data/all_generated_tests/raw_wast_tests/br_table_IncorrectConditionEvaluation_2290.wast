;; 10. **Test Description:** Create sequence control structures with `br_table` branching within blocks carrying conditions on operands leading to multiple nested branching labels. Ensure conditions enforce correct stack unwinding, verifying if the control flow adheres to specifications. The focus is on thoroughly assessing stack management through branching conditions.

(assert_invalid
  (module (func $nested-branches
    (block (block (block 
      (br_table 0 1 2 (i32.const 3)) 
      (br 2)
    ))
    (block (br_table 0 2 (i32.const 1)))
  )))
  "unknown label"
)