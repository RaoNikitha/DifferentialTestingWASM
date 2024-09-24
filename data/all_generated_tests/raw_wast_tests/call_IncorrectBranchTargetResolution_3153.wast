;; Test 2: Develop a function with a switch-case like structure using multiple `br` instructions within `block` constructs, where branches target different labels based on incoming parameters. Validate inconsistent behavior when the call instruction does not properly manage label resolution.

(assert_invalid
  (module
    (func (param i32) (param i32)
      (block $outer
        (block $inner
          (br_table $inner $outer (local.get 0))
        )
        (call 1 (local.get 1))
      )
    )
    (func (param i64))
  )
  "type mismatch"
)