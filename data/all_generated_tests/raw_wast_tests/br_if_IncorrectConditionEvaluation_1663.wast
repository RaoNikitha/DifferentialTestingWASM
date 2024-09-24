;; 4. Test a `br_if` with a label referencing a distant outermost `block`, where the condition evaluates alternately between true and false. This ensures `wizard_engine` handles both correct label indexing and condition evaluation boundaries.

(assert_invalid
  (module 
    (func (block 
      (block 
        (block 
          (block 
            (i32.const 1)
            (br_if 3 (i32.const 1))
            (i32.const 0)
            (br_if 3 (i32.const 0))
          )
        )
      )
    ))
  )
  "unknown label"
)