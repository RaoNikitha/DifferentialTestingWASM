;; Export a function containing a deeply nested block structure with multiple branches, import it into another module and call it. Ensure that stack operations within the nested blocks maintain type compliance through each level of nesting, validating the correct handling of control flow and operand stack transitions.

(assert_invalid
  (module 
    (func $deep-nested-blocks
      (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (block (result i32)
                (block (result i32)
                  (block (result i32)
                    (br 7 (i64.const 1))
                  ) 
                  (i32.const 1)
                )
                (i32.const 2)
              )
              (i32.const 3)
            )
            (i32.const 4)
          )
          (i32.const 5)
        )
        (i32.const 6)
      )
    )
  )
  "type mismatch"
)