;; Design a `br_table` with label indices accounting for a control flow that correctly matches types, but include a backward branch that implicitly requires less stack unwinding and mismatches operand types, checking if the implementation correctly adheres to type requirements for backward branches.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (loop (result i32 i32)
          (br_table 0 1 (i32.const 1) (i32.const 1))
        )
        (i32.const 0) 
      )
    )
  )
  "type mismatch"
)