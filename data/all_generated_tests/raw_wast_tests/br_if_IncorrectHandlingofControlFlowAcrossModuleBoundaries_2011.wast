;; 2. **Test Description:** Design a module that exports a function containing nested `br_if` instructions within an `if` block and call this function from a different module.    **Constraint Checked:** Correct relative label referencing within nested control structures when called externally.    **Relation:** Verifies correct handling of labels and stack unwinding between calling and called modules using exported functions.

(assert_invalid
  (module
    (func (export "testFunc")
      (block
        (if (i32.const 1)
          (then
            (br_if 0 (i32.const 1))
            (block (br_if 1 (i32.const 0)))
          )
        )
      )
    )
    (func (call 0))
  )
  "invalid label"
)