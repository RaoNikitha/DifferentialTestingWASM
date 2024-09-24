;; 6. Create a module that exports a function utilizing `br` and `br_if` instructions interspersed with `nop` before returning to the calling context. Import this function into another module, which calls it within a complex control structure (such as nested loops). This ensures proper handling of `nop` when branching occurs across module boundaries.

(assert_invalid
  (module 
    (func $complex-control
      (block $outer-block
        (loop $outer-loop
          (br_if $outer-block (i32.const 1))
          (nop)
          (loop $inner-loop
            (br_if $outer-loop (i32.const 0))
            (nop)
            (br $inner-loop)
          )
          (nop)
        )
      )
      (return)
    )
  )
  "type mismatch"
)