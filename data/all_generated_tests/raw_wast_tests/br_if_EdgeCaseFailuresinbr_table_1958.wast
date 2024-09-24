;; Test 9: Execute a `br_table` with an index that requires complex stack reconstitution, ensuring the `br_if` operations properly handle label and stack references without introducing inconsistencies.

(assert_invalid
  (module
    (func $test-br-if-stack-reconstitution
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (i32.const 1) 
            (i32.const 0)
            (br_if 0 (i32.const 1))
            (br 1)
          )
          (i32.const 1)
        )
        (return)
      )
    )
  )
  "type mismatch"
)