;; Test 5: Place `return` inside a large, deeply nested block structure, and include an `unreachable` after it. Reason: Tests context and operand stack alignment amidst nested blocks to assure correct return without hitting `unreachable`.

(assert_invalid
  (module
    (func $deeply_nested_block (result i32)
      (block
        (block
          (block
            (block
              (block
                (block
                  (block
                    (return (i32.const 1))
                  )
                )
              )
            )
          )
        )
      )
      (unreachable)
    )
  )
  "type mismatch"
)