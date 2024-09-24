;; - **Test 10**: Construct a series of nested `block` statements with `br_if` that references deeply nested labels. Follow each reference with `unreachable` instructions at different nest levels. It tests the correct management of relative label lookups and stack unwinding across complex nested constructs.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (br_if 3 (i32.const 1)) (unreachable)
            )
            (unreachable)
          )
          (unreachable)
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)