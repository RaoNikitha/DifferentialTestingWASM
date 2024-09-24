;; 3. **Test Description:**    Implement a sequence where `unreachable` is placed inside an inner block that is within multiple nested blocks and utilize `br_table` to verify if exiting behavior from nested structures occurs as speculated.    *Constraint Checked:* Block depth handling and accurate interruption through `unreachable`.    *Mismanagement Focus:* Ensuring `br_table` correctly computes nesting levels without misinterpreting unwanted block exits.

(assert_invalid
  (module (func $test-unreachable-in-nested-blocks
    (block (block (block 
      (br_table 0 1 2 (unreachable))
    )))
  ))
  "type mismatch"
)