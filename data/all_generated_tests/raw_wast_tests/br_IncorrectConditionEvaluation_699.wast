;; 10. **Test Description:**     A construct with an `if`, a nested `block` and two `br_if` instructions inside the block—one conditional on equality and the other on inequality of stack values. Test ensures each `br_if` correctly evaluates its respective condition and executes the appropriate branch.     - **Constraint:** Ensures correct evaluation of equality and inequality conditions in nested blocks with `br_if`.

(assert_invalid
  (module
    (func $conditional_br_if
      (i32.const 1)
      (i32.const 2)
      (if (result i32)
        (then
          (block
            (br_if 1 (i32.eq))
            (i32.const 3)
            (br_if 0 (i32.ne))
          )
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)