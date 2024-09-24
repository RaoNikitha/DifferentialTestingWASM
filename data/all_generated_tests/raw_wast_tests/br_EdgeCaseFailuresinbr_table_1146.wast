;; 7. **Test Description 7:**    Develop a `br_table` with unequal lengths of control structures and attempt to branch using indices that reference non-uniform depths. This tests how each engine resolves labels when nested depths vary greatly.

(assert_invalid
  (module
    (func
      (block
        (block (br_table 0 2 1 (i32.const 0) (i32.const 0)))
      )
      (block)
    )
  )
  "unknown label"
)