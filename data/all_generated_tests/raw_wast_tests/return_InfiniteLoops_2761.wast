;; 10. Test with nested loops where an internal loop performs `br` to an outer loop's label before a `return`. Stack adjustments and mismatched contexts should reveal infinite looping differentials.

(assert_invalid
  (module
    (func $nested-loops (param i32) (result i32)
      (block $outer (result i32)
        (loop $inner
          (i32.const 1)
          (br $outer)
          (return)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)