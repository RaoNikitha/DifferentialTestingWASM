;; 4. Validate the correct traversal of CFG in an extensive function with `nop` sprinkled between mixed `br` and `br_if` instructions, verifying that `nop` should not alter the target labels or branching decisions.

(assert_invalid
  (module
    (func $nested-br-nop-br_if 
      (block $outer
        (nop)
        (block $inner
          (br $outer)
          (nop)
          (br_if $inner (i32.const 1))
        )
        (nop)
      )
    )
  )
  "incorrect label or branching"
)