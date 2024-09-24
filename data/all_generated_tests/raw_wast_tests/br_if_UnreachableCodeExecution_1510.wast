;; 1. **Test 1 - Incorrect Index Label Branch**:     Create a scenario where `br_if` is given an out-of-bounds label index. This should cause an error due to attempting to branch to a non-existent label. `wizard_engine` should trigger the `OobLabel` error, whereas WASM might generically report an invalid operation. This tests the constraint of valid label reference.

(assert_invalid
  (module (func (block (br_if 1 (i32.const 1)))))
  "out of bounds label index"
)