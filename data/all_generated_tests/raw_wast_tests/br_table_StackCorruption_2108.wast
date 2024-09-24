;; 8. **Invalid Structured Control Flow Branching:**    - Focus on a scenario where `br_table` attempts to branch into deeper inner blocks contrary to structured control flow rules. Examine how stack unwinding is affected by these invalid jumps.

(assert_invalid
  (module (func
    (block (br_table 2 0 (block (br 1)) (i32.const 0)) )
  ))
  "invalid branching to inner block"
)