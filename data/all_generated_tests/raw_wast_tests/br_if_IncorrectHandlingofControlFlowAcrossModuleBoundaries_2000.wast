;; 1. **Test Description**:    - **Scenario**: Call an imported function that performs a `br_if` to an outer `block` labeled `0` within the calling module.    - **Constraint**: Validate that the `br_if` resolves to the correct label and unwinds the stack accurately in both modules.    - **Differential Focus**: Check if the divergence in label argument fetching affects backward jumps to nested blocks across module boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32)))
    (func $test
      (block
        (call $external_func (i32.const 1))
        (block (br_if 0 (i32.const 1)))
      )
    )
  )
  "unknown label"
)