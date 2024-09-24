;; 3. **Test Description:** Inside a block containing an `unreachable`, use `br_table` to jump to different labels based on stack values. The unreachable should be reached for an index not covered by `br_table`.    - **Constraint Checked:** Checks the correct implementation of `br_table` and its interactions with `unreachable`.    - **Incorrect Branch Target Relation:** Verifies if incorrect indices in `br_table` resolution cause proper execution of `unreachable`.

(assert_invalid
 (module (func
   (block
     (block
       (br_table 0 0 (i32.const 2))
       (unreachable)
     )
     (unreachable)
   )
 ))
 "type mismatch"
)