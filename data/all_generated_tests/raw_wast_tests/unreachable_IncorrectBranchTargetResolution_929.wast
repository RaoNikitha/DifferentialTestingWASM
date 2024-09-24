;; 10. **Test Description:** Utilize `unreachable` followed by a `br` targeting the label of an outer block with several nested `if-else` blocks, testing the correct resolution amidst conditional branches.    *Constraint Checked:* Resolution accuracy for branches amidst multiple `if-else` constructs.    *Relation to Incorrect Branch Target Resolution:* Seeks out misresolution of branch targets due to multiple stacked conditionals.

(assert_invalid
  (module
    (func $test-unreachable-with-nested-branches
      (block (block (block (if (i32.const 1) (then (unreachable)) (else (br 2)))))
    )
  )
  "type mismatch"
)