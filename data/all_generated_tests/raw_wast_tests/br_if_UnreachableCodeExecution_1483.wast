;; 4. **Test 4**: Construct an edge case where `br_if` references the maximum valid label depth permissible. Place `unreachable` instructions both within the valid branch and after the `br_if` to test if improper depth checking erroneously allows code execution reaching `unreachable`.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (block
              (block
                (block
                  (block
                    (block
                      (block
                        (block
                          (br_if 9 (i32.const 1))
                          unreachable
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
      unreachable
    )
  )
  "type mismatch"
)