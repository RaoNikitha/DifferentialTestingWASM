;; 1. **Test 1: Basic Sequential Instructions with `nop`**:    - **Description**: Create a sequence of instructions where multiple `nop` instructions are interleaved with branch instructions (`br`). Ensure that the `br` instructions target nested blocks to check if `nop` affects branch target resolution.    - **Constraint**: Validate that `nop` does not interfere with the branch targets and the program flow correctly proceeds to the labeled blocks.    - **Relation to Incorrect Branch Target Resolution**: Confirms that `nop` does not shift labels or affect subsequent branch targets.

(assert_invalid
  (module
    (func (block $label0
            (nop)
            (br $label0)
            (nop)
            (br $label0)
            (nop))
    )
  )
  "unreachable block"
)