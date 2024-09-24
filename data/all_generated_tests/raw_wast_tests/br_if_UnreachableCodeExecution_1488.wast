;; 9. **Test 9**: Implement `br_if` instructions within nested `block` and `if` structures, targeting the same label index but from different nesting depths. Include an `unreachable` in non-targeted paths to ensure label resolution does not cross boundaries incorrectly.

(assert_invalid
  (module
    (func $test-9
      (block
        (block
          (if 
            (then 
              (br_if 1 (i32.const 1))
            )
          )
          (unreachable)
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)