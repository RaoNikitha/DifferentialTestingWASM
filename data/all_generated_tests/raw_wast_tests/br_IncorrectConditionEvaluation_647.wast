;; 8. **Multiple `br_if` in Sequence:**    - Multiple `br_if` instructions in sequence, each with alternating true and false conditions. Check if each branch behaves according to its condition independently.    - Constraint Checked: Sequential evaluation of multiple conditions.    - Relation: Ensures sequential conditional branching works without interference.

(assert_invalid
  (module (func $multiple-br_if-sequence
    (block 
      (block 
        (br_if 0 (i32.const 0)) 
        (br_if 1 (i32.const 1)) 
        (br_if 0 (i32.const 1)) 
        (br_if 1 (i32.const 0))
      )
    )
  ))
  "unknown label"
)