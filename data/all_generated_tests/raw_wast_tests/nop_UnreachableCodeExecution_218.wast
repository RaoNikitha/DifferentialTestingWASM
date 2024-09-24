;; 9. **Test 9**:     - Description: Construct a function splitting into multiple nested blocks with `nop` instructions sprinkled, and checks if erroneous jumps are resulting in `unreachable` being reached to spot if `nop` causes wrong branches.    - Constraint: Ensuring `nop` does not induce unexpected jumps inside nested blocks.

(assert_invalid
  (module
    (func (block (block (nop) (br 1) (block (nop) (br 1) (unreachable))) (nop) (unreachable)))
  )
  "undefined label"
)