;; 2. **Test Description**: A nested `block` structure where `br_table` references labels outside the allowed depth, testing if incorrect label resolution leads to a branch outside the intended control structure.

(assert_invalid
  (module
    (func $nested-block-outside-depth
      (block
        (block
          (loop
            (i32.const 0)
            (br_table 0 1 2) ;; Referencing label 2 not within allowable depth
          )
        )
      )
    )
  )
  "unknown label"
)