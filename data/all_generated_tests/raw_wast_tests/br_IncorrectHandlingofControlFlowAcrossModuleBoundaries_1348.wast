;; 9. **Test Description:** Construct a test where an imported function has a `br` instruction targeting a label defined in the exporting module. Ensure that label and operand handling are correctly maintained across module calls.    - **Constraint:** Ensures correct label definition and operand handling across module boundaries in function calls.    - **Relation:** Detects issues in label definition lookups and operand management for branches across modules.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $main_func
      (local $0 i32)
      block
        call $external_func
        br 0
      end
    )
  )
  "unknown label"
)