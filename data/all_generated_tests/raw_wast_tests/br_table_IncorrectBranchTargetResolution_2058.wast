;; 8. **Test Description**: A complex sequence of `br_table` instructions with different label arities inside a `block` and `loop`, testing if multiple branching instructions resolve correctly or lead to unexpected behavior due to incorrect label handling.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (loop (result i32) 
          (block (result i32)
            (br_table 0 1 (i32.const 2) (local.get 0))
          )
        )
      )
    )
  )
  "type mismatch"
)