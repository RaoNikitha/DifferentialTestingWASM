;; 5. Create a series of instructions in a `br_table` that execute different code paths each containing a `nop` followed by arithmetic operations with different types like `i32.add` and `f64.div`. Ensure correct type propagation within multiple branching table paths.

(assert_invalid
  (module
    (func
      (block
        (br_table 0 0 0
          (nop)
          (i32.add (i32.const 1) (i32.const 2)))
      )
      (block
        (br_table 0 0 0
          (nop)
          (f64.div (f64.const 3.0) (f64.const 2.0)))
      )
    )
  )
)