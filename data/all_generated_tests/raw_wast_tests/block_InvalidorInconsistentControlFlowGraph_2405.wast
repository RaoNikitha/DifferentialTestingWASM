;; 6. **Branched Block with Misconfigured End State**:    - Configure a block containing a branch table (`br_table`) with multiple branches, each assuming a different and incorrect stack state at exit.    - This checks the robustness of CFG validation when multiple branching paths exist within a block.

(assert_invalid
  (module
    (func (block
      (block (br_table 0 1 0) (i32.const 0)) 
      (i32.const 0)
      (end)
    ))
  )
  "type mismatch"
)