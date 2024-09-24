;; 6. **Test Description:** Develop a scenario with multiple nested loops where an inner loop contains a `br` instruction that should only exit the outermost loop based on a complex condition. This will test proper termination conditions and accurate label referencing to prevent infinite loops.

(assert_invalid
  (module
    (func $complex-loop-branch
      (block $outer 
        (loop $middle 
          (loop $inner 
            (br_if $outer (i32.eq (i32.const 1) (i32.const 1)))
          )
        )
      )
    )
  )
  "label index out of bounds"
)