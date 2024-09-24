;; 5. **Test Description:**    Develop a scenario where a module has multiple nested blocks and calls an imported function that uses a `br` instruction to target and branch to a specific outer block. Confirm that the branch is correctly handled, referring to the right label index.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test_func
      (block $outer
        (block $inner
          (call $external_func)
          (br 1)
        )
        (return)
      )
    )
  )
  "type mismatch"
)