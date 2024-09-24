;; 5. **Test Description:** Use a `block` containing several nested `if-else` constructs, with `br` instructions in various nested `if` branches targeting the block's end. This test checks handling of deep nesting and if the CFG accounts correctly for nested conditional exits, which might be mis-handled by wizard_engine.

(assert_invalid
  (module
    (func $deep-nested-if-else (result i32)
      (block (result i32)
        (if (i32.const 1)
          (then
            (if (i32.const 1)
              (then
                (if (i32.const 1)
                  (then
                    (br 1)
                  )
                )
              )
            )
          )
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)