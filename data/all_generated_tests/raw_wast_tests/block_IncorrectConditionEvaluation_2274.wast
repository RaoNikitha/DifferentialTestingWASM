;; 5. Design a complex block structure with `br_if`, where the condition depends on a combination of `i32.lt_s` comparisons. This will test whether mixed condition checks within a nested scope are correctly evaluated.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (br_if 1
            (i32.lt_s (i32.const 1) (i32.const 2))
          )
        )
        (br 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)