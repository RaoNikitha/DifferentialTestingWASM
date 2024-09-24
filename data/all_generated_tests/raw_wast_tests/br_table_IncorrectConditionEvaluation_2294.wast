;; Test 4: Create a function with deeply nested `block` and `loop` constructs, and use `br_table` to branch to labels at varying depths. Verify if the nested label indexing is correctly interpreted based on the relative nesting depth. The test examines relative label index calculation under complex nesting.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (block (result i32)
              (br_table 0 1 2 3 (i32.const 4) (local.get 0))
            )
          )
        )
      )
    )
  )
  "unknown label"
)