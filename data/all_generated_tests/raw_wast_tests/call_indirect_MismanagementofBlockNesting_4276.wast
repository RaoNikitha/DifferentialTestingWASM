;; 5. **Out-of-bound table index inside deep conditional branches**:    - **Description**: Under complex nested conditional branches, use an indirect call to an out-of-bound table index and determine if both implementations trap correctly.    - **Expected outcome**: Validate proper bounds checking and accurate trapping under multiple levels of conditional nesting.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func
      (block
        (loop
          (if (i32.const 1)
            (then
              (if (i32.const 0)
                (then
                  (call_indirect (type 0) (i32.const 10))
                )
              )
            )
          )
        )
      )
    )
  )
  "out-of-bounds table index"
)