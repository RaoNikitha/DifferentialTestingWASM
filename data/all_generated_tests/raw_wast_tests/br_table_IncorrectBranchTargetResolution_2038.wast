;; 9. **Forward Branch with Operand Misalignment:**    - Create a `br_table` that branches forward to a block expecting different operand types than provided by the branch.    - *Testing for*: Operand stack type alignment for forward branches.    - *Constraint*: Forward branches and operand type matching.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block (result i64)
          (i32.const 1)
          (br_table 0 1 (i32.const 0))
        )
        (i32.add) (drop)
      )
    )
  )
  "type mismatch"
)