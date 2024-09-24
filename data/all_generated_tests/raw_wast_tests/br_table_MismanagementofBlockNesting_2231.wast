;; 1. **Test Description:** Construct a module wherein the `br_table` indices refer to nested blocks with varying depths, ensuring a branching point deep within nested structures. Test to verify if the control flow correctly exits the intended nested block or incorrectly exits the outer block.

(assert_invalid
  (module (func $nested-br_table
    (block
      (loop
        (block
          (block (result i32)
            (block
              (block (result i32)
                (br_table 1 2 3 (i32.const 4))
              )
              (nop)
            )
          )
          (drop)
        )
      )
    )
  ))
  "unknown label"
)