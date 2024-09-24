;; 2. **Test Description 2:**    - **Focus:** Branch from an imported function to a local block.    - **Constraint:** Ensure the `br` instruction can correctly target local labels after returning control from an imported function.    - **Incorrect Handling:** Failure to restore the correct stack state or misinterpretation of label scopes.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc))
    (func $testFunc
      (block $outerBlock
        (call $externalFunc)
        (br 0)
      )
    )
  )
  "label 0 not found"
)