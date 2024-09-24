;; 8. Create a `br_table` inside a function that uses multiple loops and conditional branches. Some labels should target loop entries, while others target exits. Randomize the target label by assigning a random but valid operand, testing how dynamic control flow leads to CFG inconsistency.

(assert_invalid
  (module
    (func (param i32) (param i32) (result i32)
      (block (result i32)
        (loop (result i32)
          (if (result i32)
            (then
              (block (result i32)
                (block (drop (local.get 0) (br_table 0 2 1 (i32.const 2))))
                (br 0)
              )
              (br 1)
            )
            (else
              (block (result i32)
                (br_table 0 1 3 (local.get 1))
                (unreachable)
              )
            )
          )
        )
      )
    )
  )
  "CFG inconsistency"
)