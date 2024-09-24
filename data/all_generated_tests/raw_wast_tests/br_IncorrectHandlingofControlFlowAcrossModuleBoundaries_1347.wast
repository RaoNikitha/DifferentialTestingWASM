;; 8. **Test Description:** Develop a test with an exported function containing a `br` instruction targeting a block in an importing module. Check for correct handling of the transition and operand stack consistency.    - **Constraint:** Checks label validity and stack consistency when branch targets exist across module boundaries.    - **Relation:** Tests if control flow transitions and stack management are correctly handled across module boundaries.

(assert_invalid
  (module
    (import "env" "imported_func" (func))
    (func $test
      (block (result i32)
        (call 0)
        (br 0 (i32.const 42))
      )
    )
    (export "test" (func $test))
  )
  "label unknown"
)