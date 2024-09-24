;; 8. **Test Description**:    Create a block with complicated stack operations followed by an implicit branch (e.g., `br_table`). This setup will discern the ability of the environment to manage stack states during table-driven branching. Differences in handling complex implicit labels and branches can reveal stack corruption issues.

(assert_invalid
  (module (func $complex-stack-implicit-branch
    (block (result i32)
      (i32.const 0) (i32.const 1) (i32.add)
      (block (result i32)
        (i32.const 2) (i32.mul)
        (block (result i32)
          (i32.const 3) (i32.sub)
          br_table 0
        )
      )
    )
  ))
  "type mismatch"
)