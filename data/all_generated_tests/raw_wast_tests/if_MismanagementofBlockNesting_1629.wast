;; Test 10: Develop a compound sequence with multiple `if` branching inside nested `block`s and `loop`s, validating both the true and false paths. Place `br` and `br_if` instructions within nested blocks to test mismanagement in differently conditioned paths and validate resultant stack consistency.

(assert_invalid
  (module
    (func $test10
      (block (result i32)
        (i32.const 1)
        (if (result i32)
          (then
            (i32.const 1)
            (block (result i32)
              (i32.const 1)
              (loop (result i32)
                (if
                  (then
                    (i32.const 2)
                    (br_if 1 (i32.const 0))
                  )
                  (else
                    (br 1)
                  )
                )
              )
            )
            (i32.const 2)
          )
          (else
            (i32.const 2)
          )
        )
      )
    )
  )
  "type mismatch"
)